import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:tutors/core/constants/app_colors.dart';

class AvatarWidget extends StatelessWidget {
  final double width;
  final double height;
  final String imageUrl;
  final bool isCircle;
  const AvatarWidget({
    super.key,
    this.width = 45.0,
    this.height = 45.0,
    required this.imageUrl,
    this.isCircle = true,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: AppColors.greyColor,
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.white,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: AppColors.greyColor,
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            border: Border.all(
              color: Colors.white,
            ),
          ),
        );
      },
      progressIndicatorBuilder: (context, url, progress) {
        return Skeleton(
          isLoading: true,
          skeleton: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                color: AppColors.greyColor,
                border: Border.all(
                  color: Colors.white,
                )),
          ),
          child: const SizedBox(),
        );
      },
    );
  }
}
