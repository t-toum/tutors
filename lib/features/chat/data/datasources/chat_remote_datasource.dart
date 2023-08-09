import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/firebase_collection.dart';
import 'package:tutors/core/extensions/string_extension.dart';
import 'package:tutors/core/models/users.dart';
import 'package:tutors/core/services/cloud_firestore_service.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/chats.dart';
import '../../../../core/models/message.dart';

abstract class ChatRemoteDatasource {
  Stream<List<Chat>> getChatList(String userID);
  Future<Users> getUserInfo(String userId);
  Stream<List<Message>> getMessage(String senderID, receiverID);
  Future<void> sendMessage({required Message chatData});
}

@LazySingleton(as: ChatRemoteDatasource)
class ChatRemoteDatasourceImpl implements ChatRemoteDatasource {
  final FirebaseFirestore _firebaseFirestore;
  final CouldFireStoreService _couldFireStoreService;
  ChatRemoteDatasourceImpl(
      this._firebaseFirestore, this._couldFireStoreService);
  @override
  Stream<List<Chat>> getChatList(String userID) {
    final dataSnapshot =
        _firebaseFirestore.collection(FireCollection.chat).snapshots();
    return dataSnapshot.map((event) {
      final value = event.docs.map((e) {
        Map<String, dynamic> map = e.data();
        map['id'] = e.id;
        return Chat.fromJson(map);
      }).toList();
      return value.where((e) => e.id.containsWithNull(userID)).toList();
    });
  }

  @override
  Future<Users> getUserInfo(String userId) async {
    return await _couldFireStoreService.getUser(docID: userId);
  }

  @override
  Stream<List<Message>> getMessage(String senderID, receiverID) {
    final res = _firebaseFirestore
        .collection(FireCollection.message)
        .where('senderID', isEqualTo: senderID)
        .where("receiverID", isEqualTo: receiverID)
        .snapshots();
    return res.map((event) {
      return event.docs.map((data) => Message.fromJson(data.data())).toList();
    });
  }

  @override
  Future<void> sendMessage({required Message chatData}) async {
    try {
      await _firebaseFirestore
          .collection(FireCollection.chat)
          .doc("${chatData.senderID}${chatData.receiverID}")
          .set({
        "senderID": chatData.senderID,
        "receiverID": chatData.receiverID
      });
      return await _couldFireStoreService.setData(
        collection: FireCollection.message,
        data: chatData.toJson(),
      );
    } on FirebaseException catch (e) {
      throw ServerException(e.message);
    }
  }
}
