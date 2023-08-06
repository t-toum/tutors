import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/constants/app_images.dart';

class ImageCourseWidget extends StatelessWidget {
  final String? url;
  const ImageCourseWidget({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ?? AppImages.defaultImage,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
              color: AppColors.greyColor,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
        );
      },
      placeholder: (context, url) {
        return Container(
          width: 150,
          height: 100,
          color: AppColors.greyColor,
        );
      },
    );
  }
}
