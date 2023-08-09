import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/firebase_collection.dart';
import 'package:tutors/core/models/users.dart';
import 'package:tutors/core/services/cloud_firestore_service.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/chat_room.dart';
import '../../../../core/models/message.dart';

abstract class ChatRemoteDatasource {
  Stream<List<ChatRoom>> getChatList(String userID);
  Future<Users> getUserInfo(String userId);
  Stream<List<Message>> getMessage(String roomId);
  Future<String?> createChatRoom({required ChatRoom chatRoom});
  Future<void> sendMessage({required Message chatData});
}

@LazySingleton(as: ChatRemoteDatasource)
class ChatRemoteDatasourceImpl implements ChatRemoteDatasource {
  final FirebaseFirestore _firebaseFirestore;
  final CouldFireStoreService _couldFireStoreService;
  ChatRemoteDatasourceImpl(
      this._firebaseFirestore, this._couldFireStoreService);
  @override
  Stream<List<ChatRoom>> getChatList(String userID) {
    final dataSnapshot = _firebaseFirestore
        .collection(FireCollection.chatRoom)
        .where('members', arrayContains: userID)
        .snapshots();
    return dataSnapshot.map((event) {
      final value = event.docs.map((e) {
        Map<String, dynamic> map = e.data();
        map['id'] = e.id;
        return ChatRoom.fromJson(map);
      }).toList();
      return value;
    });
  }

  @override
  Future<Users> getUserInfo(String userId) async {
    return await _couldFireStoreService.getUser(docID: userId);
  }

  @override
  Stream<List<Message>> getMessage(String roomId) {
    final res = _firebaseFirestore
        .collection(FireCollection.message)
        .where('roomId', isEqualTo: roomId)
        .snapshots();
    return res.map((event) {
      List<Message> listData =
          event.docs.map((data) => Message.fromJson(data.data())).toList();
      return listData;
    });
  }

  @override
  Future<void> sendMessage({required Message chatData}) async {
    try {
      return await _couldFireStoreService.setData(
        collection: FireCollection.message,
        data: chatData.toJson(),
      );
    } on FirebaseException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<String?> createChatRoom({required ChatRoom chatRoom}) async {
    final data = await _firebaseFirestore
        .collection(FireCollection.chatRoom)
        .where("members", arrayContainsAny: chatRoom.members)
        .get();
    List<ChatRoom> listChatRoom =
        data.docs.map((e) => ChatRoom.fromJson(e.data())).toList();
    Function eq = const ListEquality().equals;
    if (listChatRoom
        .where((element) => eq(element.members, chatRoom.members))
        .isEmpty) {
      final dataSnap = await _firebaseFirestore
          .collection(FireCollection.chatRoom)
          .add(chatRoom.toJson());
      return dataSnap.id;
    } else {
      return "";
    }
  }
}
