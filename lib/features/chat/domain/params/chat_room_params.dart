import 'package:tutors/core/models/users.dart';

class ChatRoomParams {
  final String senderID;
  final String receiverID;
  final Users? reciever;

  ChatRoomParams({
    required this.senderID,
    required this.receiverID,
    this.reciever
  });
}
