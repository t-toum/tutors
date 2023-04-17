import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
              fit: BoxFit.contain,
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
          child:const Center(
            child: CircularProgressIndicator(
              strokeWidth: 1,
              color: AppColors.primaryColor,
            ),
          ),
        );
      },
    );
  }
}
