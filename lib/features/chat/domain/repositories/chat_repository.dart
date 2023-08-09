import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/message.dart';

import '../../../../core/models/chats.dart';
import '../../../../core/models/users.dart';

abstract class ChatRepository {
  Stream<List<Chat>> getChatList({
    required String senderID,
  });
  Future<Either<Failure,Users>>getUserInfo(String userId);

  Stream<List<Message>> getMessage({
    required String senderID,
    required String receiverID,
  });
  Future<Either<Failure,void>>sendMessage({required Message chatData});
}
