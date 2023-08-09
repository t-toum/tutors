import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/constants/app_images.dart';
import 'package:tutors/core/models/users.dart';

class ChatListItem extends StatelessWidget {
  final Users? users;
  final Function()? onTap;
  const ChatListItem({super.key, this.users, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CachedNetworkImage(
                imageUrl: users?.profileUrl ?? AppImages.defaultImage,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.greyColor,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                  child: Text(
                "${users?.firstName ?? ''} ${users?.lastName ?? ''}",
                style: Theme.of(context).textTheme.titleMedium,
              ))
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
