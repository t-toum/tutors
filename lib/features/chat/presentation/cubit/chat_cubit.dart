import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/extensions/either_extension.dart';
import 'package:tutors/core/models/message.dart';
import 'package:tutors/core/models/users.dart';

import '../../../../core/models/chats.dart';
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

  late TextEditingController chatTextController;
  ChatCubit(
    this._getChatListUsecase,
    this._getUserInfoUsecase,
    this._getMessageUsecase,
    this._sendMessageUsecase,
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

  void getChatList(String senderID) async {
    emit(state.copyWith(status: DataStatus.loading));

    try {
      final chatList = _getChatListUsecase(senderID);
      chatList.listen((event) async {
        List<Chat> listChat = [];
        for (Chat chat in event) {
          final recever = await getUserInfo(chat.receiverID ?? '');
          chat = chat.copyWith(receiver: recever);
          listChat.add(chat);
        }
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

  void getMessage(
      {required String senderID, required String receiverID}) async {
    emit(state.copyWith(status: DataStatus.loading));
    try {
      final messageStream = _getMessageUsecase(
          GetMessageParams(senderID: senderID, receiverID: receiverID));
      messageStream.listen((event) {
        if(isClosed)return;
        emit(state.copyWith(lisMessage: event, senderID: senderID,receiverID: receiverID, status: DataStatus.success));
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
      );
      final result = await _sendMessageUsecase(chatData);
      if (result.isLeft()) {
        emit(state.copyWith(
            status: DataStatus.failure, error: result.getLeft()?.msg));
      }else{
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
