import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/widgets/loading_widget.dart';
import 'package:tutors/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../../../../core/navigator/app_navigator.dart';
import '../../../../core/routes/route_path.dart';
import '../../domain/params/chat_room_params.dart';
import '../widgets/chat_item.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.kMessage.tr()),
      ),
      body: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          if (state.status == DataStatus.loading) {
            return const LoadingWidget();
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: state.chatList?.map((chat) {
                    return ChatListItem(
                      onTap: () {
                        AppNavigator.navigateTo(
                          RoutePath.chatRoomRoute,
                          params: ChatRoomParams(
                            senderID: state.currentUser?.id ?? '',
                            receiverID: chat.receiver?.id ?? '',
                            reciever: chat.receiver,
                          ),
                        );
                      },
                      users: chat.receiver,
                    );
                  }).toList() ??
                  [],
            ),
          );
        },
      ),
    );
  }
}
