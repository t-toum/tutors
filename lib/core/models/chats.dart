import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tutors/core/models/users.dart';
part 'chats.freezed.dart';
part 'chats.g.dart';
@freezed
class Chat with _$Chat {
  const factory Chat({
    final String? id,
    final String? receiverID,
    final String? senderID,
    final Users? receiver,
  }) = _Chat;

  factory Chat.fromJson(Map<String,dynamic>json)=>_$ChatFromJson(json);
}

