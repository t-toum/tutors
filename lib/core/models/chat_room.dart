import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tutors/core/models/users.dart';
import '../utils/json_coverter.dart';
part 'chat_room.freezed.dart';
part 'chat_room.g.dart';


@freezed
class ChatRoom with _$ChatRoom {
  const factory ChatRoom({
    final String? id,
    final List<String>? members,
    final Users? receiver,
    @TimestampConverter()
    final DateTime? createdDate,
  }) = _ChatRoom;

  factory ChatRoom.fromJson(Map<String,dynamic>json)=>_$ChatRoomFromJson(json);
}

