import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/constants/app_images.dart';
import 'package:tutors/core/models/users.dart';

class RegisterItem extends StatelessWidget {
  final Users? item;
  final Function()? onTap;
  const RegisterItem({super.key, this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: item?.profileUrl ?? AppImages.defaultImage,
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
                width: 10,
              ),
              Text(
                "${item?.firstName} ${item?.lastName}",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          )),
          InkWell(
            onTap: onTap,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.bubble),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
