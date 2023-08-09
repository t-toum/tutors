import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/extensions/date_time_extension.dart';
import 'package:tutors/core/extensions/either_extension.dart';
import 'package:tutors/core/extensions/list_extension.dart';
import 'package:tutors/core/models/message.dart';
import 'package:tutors/core/models/users.dart';

import '../../../../core/models/chat_room.dart';
import '../../domain/usecases/create_chat_room_usecase.dart';
import '../../domain/usecases/get_chat_list_usecase.dart';
import '../../domain/usecases/get_message_usecase.dart';
import '../../domain/usecases/get_user_info_usecase.dart';
import '../../domain/usecases/send_message_usecase.dart';

part 'chat_cubit.freezed.dart';
part 'chat_state.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  final GetChatListUsecase _getChatListUsecase;
  final GetUserInfoUsecase _getUserInfoUsecase;
  final GetMessageUsecase _getMessageUsecase;
  final SendMessageUsecase _sendMessageUsecase;
  final CreateChatRoomUsecase _createChatRoomUsecase;

  late TextEditingController chatTextController;
  ChatCubit(
    this._getChatListUsecase,
    this._getUserInfoUsecase,
    this._getMessageUsecase,
    this._sendMessageUsecase,
    this._createChatRoomUsecase,
  ) : super(const ChatState()) {
    chatTextController = TextEditingController();
  }

  void setCurrentUser(Users? users) {
    emit(state.copyWith(currentUser: users));
  }

  void setReciever(Users? users) {
    emit(state.copyWith(
      reveiver: users,
    ));
  }

  Future<void> createChatRoom(
      {required String senderId,
      required String receiverId,
      String? roomId}) async {
    emit(state.copyWith(status: DataStatus.loading));
    if (roomId != null) {
      getMessage(roomId: roomId);
      emit(state.copyWith(senderID: senderId,receiverID: receiverId,currentRoomId: roomId,));
    } else {
      ChatRoom chatRoom = ChatRoom(
          members: [senderId, receiverId], createdDate: DateTime.now());
      final result = await _createChatRoomUsecase(chatRoom);
      if (result.isLeft()) {
        emit(state.copyWith(
            status: DataStatus.failure, error: result.getLeft()?.msg));
      } else {
        final room= result.getRight();
        getMessage(roomId: room??'');
        emit(state.copyWith(senderID: senderId,receiverID: receiverId,currentRoomId: room,));
      }
    }
  }

  void getChatList(String senderID) async {
    emit(state.copyWith(status: DataStatus.loading));
    try {
      final chatList = _getChatListUsecase(senderID);
      chatList.listen((event) async {
        List<ChatRoom> listChat = [];
        for (ChatRoom chat in event) {
          String? recId = chat.members.firstWhereOrNull((e) => e != senderID);
          final recever = await getUserInfo(recId ?? '');
          chat = chat.copyWith(receiver: recever);
          listChat.add(chat);
        }
        if (isClosed) return;
        emit(state.copyWith(chatList: listChat, status: DataStatus.success));
      });
    } catch (e) {
      emit(state.copyWith(
        status: DataStatus.failure,
        error: e.toString(),
      ));
      await close();
    }
  }

  Future<Users?> getUserInfo(String userId) async {
    final result = await _getUserInfoUsecase(userId);
    if (result.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: result.getLeft()?.msg));
      return null;
    } else {
      return result.getRight();
    }
  }

  void getMessage({required String roomId}) async {
    emit(state.copyWith(status: DataStatus.loading));
    try {
      final messageStream = _getMessageUsecase(roomId);
      messageStream.listen((event) {
        if (isClosed) return;
        event.sort((a, b) => a.createdDate.compareToWithNull(b.createdDate));
        emit(state.copyWith(lisMessage: event, status: DataStatus.success));
      });
    } catch (e) {
      emit(state.copyWith(
        status: DataStatus.failure,
        error: e.toString(),
      ));
      await close();
    }
  }

  Future<void> onSendMessage() async {
    if (chatTextController.text.trim().isNotEmpty) {
      Message chatData = Message(
        senderID: state.senderID,
        receiverID: state.receiverID,
        createdDate: DateTime.now(),
        message: chatTextController.text,
        roomId: state.currentRoomId
      );
      final result = await _sendMessageUsecase(chatData);
      if (result.isLeft()) {
        emit(state.copyWith(
            status: DataStatus.failure, error: result.getLeft()?.msg));
      } else {
        chatTextController.clear();
      }
    }
  }

  @override
  Future<void> close() {
    chatTextController.dispose();
    return super.close();
  }
}
