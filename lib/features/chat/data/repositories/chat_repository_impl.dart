import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/message.dart';
import 'package:tutors/core/models/users.dart';
import 'package:tutors/features/chat/domain/repositories/chat_repository.dart';

import '../../../../core/models/chat_room.dart';
import '../datasources/chat_remote_datasource.dart';

@LazySingleton(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDatasource _datasource;

  ChatRepositoryImpl(this._datasource);

  @override
  Stream<List<ChatRoom>> getChatList({required String senderID}) {
    return _datasource.getChatList(senderID);
  }

  @override
  Future<Either<Failure, Users>> getUserInfo(String userId) async {
    try {
      return Right(await _datasource.getUserInfo(userId));
    } on FirebaseException catch (e) {
      return Left(ServerFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    }
  }

  @override
  Stream<List<Message>> getMessage(
      {required String roomId}) {
    return _datasource.getMessage(roomId);
  }

  @override
  Future<Either<Failure, void>> sendMessage({required Message chatData}) async {
    try {
      return Right(await _datasource.sendMessage(chatData: chatData));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    }
  }

  @override
  Future<Either<Failure, String?>> createChatRoom(
      {required ChatRoom chatRoom}) async {
    try {
      return Right(await _datasource.createChatRoom(chatRoom: chatRoom));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    }
  }
}
