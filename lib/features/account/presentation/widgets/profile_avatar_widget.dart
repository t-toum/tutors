import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tutors/core/constants/app_images.dart';

import '../../../../core/constants/app_colors.dart';

class ProfileAvatarWidget extends StatelessWidget {
  final String url;
  final Function()? onTap;
  const ProfileAvatarWidget({
    super.key,
    required this.url,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: onTap,
          child: CachedNetworkImage(
            imageUrl: url,
            imageBuilder: (context, imageProvider) {
              return Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            errorWidget: (context, url, error) {
              return Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5),
                  image: const DecorationImage(
                      image: AssetImage(AppImages.profile), fit: BoxFit.cover),
                ),
              );
            },
            progressIndicatorBuilder: (context, url, progress) {
              return Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.5),
                ),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          left: 80,
          top: 70,
          child: Container(
            width: 20,
            height: 20,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 1.5,
              ),
            ),
            child: Image.asset(
              AppImages.plusWhite,
            ),
          ),
        )
      ],
    );
  }
}
