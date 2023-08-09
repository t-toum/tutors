import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:tutors/core/models/message.dart';

class ChatRoom extends StatelessWidget {
  final bool isSelf;
  final Message? message;
  const ChatRoom({super.key, this.isSelf = false, this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Row(
        mainAxisAlignment:isSelf? MainAxisAlignment.end:MainAxisAlignment.start,
        children: [
          Bubble(
            child: Text(message?.message??''),
          ),
        ],
      ),
    );
  }
}
