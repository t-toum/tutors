import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/models/users.dart';
import 'package:tutors/core/widgets/loading_widget.dart';
import 'package:tutors/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../widgets/chat_room.dart';

class ChatRoomPage extends StatelessWidget {
  final Users? reciever;
  const ChatRoomPage({super.key, this.reciever});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("${reciever?.firstName} ${reciever?.lastName}"),
          ),
          body: (state.status == DataStatus.loading)
              ? const LoadingWidget()
              : Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        child: Column(
                          children: state.lisMessage?.map((message) {
                                return ChatRoom(
                                  isSelf: message.senderID == state.senderID,
                                  message: message,
                                );
                              }).toList() ??
                              [],
                        ),
                      ),
                    ),
                    Container(
                      color: AppColors.greyColor.withOpacity(0.5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextField(
                            controller: cubit.chatTextController,
                            decoration: InputDecoration(
                              hintText: LocaleKeys.kMessage.tr(),
                              isDense: true,
                              border: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.primaryColor),
                              ),
                            ),
                          )),
                          TextButton(
                            onPressed: () {
                              cubit.onSendMessage();
                            },
                            child: Text(LocaleKeys.kSend.tr()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
