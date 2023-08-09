import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:tutors/core/extensions/date_time_extension.dart';
import 'package:tutors/core/models/message.dart';

class ChatRoom extends StatelessWidget {
  final bool isSelf;
  final Message? message;
  const ChatRoom({super.key, this.isSelf = false, this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment:
            isSelf ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Bubble(
            color: isSelf?const Color.fromRGBO(225, 255, 199, 1.0):const Color.fromRGBO(212, 234, 244, 1.0),
            nip: (isSelf) ? BubbleNip.rightTop : BubbleNip.leftTop,
            child: Column(
              crossAxisAlignment:
                  isSelf ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  constraints:
                BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 2),
                  child: Text(
                    message?.message ?? '',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  message?.createdDate.shortDate() ?? '',
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
