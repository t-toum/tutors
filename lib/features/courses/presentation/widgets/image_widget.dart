import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tutors/core/constants/app_images.dart';

class ImageWidget extends StatelessWidget {
  final String? url;
  const ImageWidget({super.key, this.url});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ?? AppImages.defaultImage,
      progressIndicatorBuilder: (context, url, progress) {
        return Container(
          width: double.infinity,
          height: 200,
          color: Colors.grey.shade100,
          child:const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      imageBuilder: (context, imageProvider) {
        return Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          width: double.infinity,
          height: 200,
          color: Colors.grey.shade100,
          child:const Center(
            child: Text("Couldn't show this image"),
          ),
        );
      },
    );
  }
}
