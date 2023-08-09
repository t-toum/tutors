
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tutors/core/models/users.dart';
import '../utils/json_coverter.dart';
part 'message.freezed.dart';
part 'message.g.dart';
@freezed
class Message with _$Message{
  const factory Message({
    final String? roomId,
    final String? senderID,
    final String? receiverID,
    @TimestampConverter()
    final DateTime? createdDate,
    final String? message,
    final Users? receiver,

  })= _Message;
  factory Message.fromJson(Map<String,dynamic>json)=>_$MessageFromJson(json);
}