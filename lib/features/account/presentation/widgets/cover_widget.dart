import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tutors/core/navigator/app_navigator.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';

class CoverWidget extends StatelessWidget {
  final String url;
  final Function()? onTap;

  const CoverWidget({super.key, required this.url, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: url,
            imageBuilder: (context, imageProvider) {
              return Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              );
            },
            errorWidget: (context, url, error) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.profileCover),
                      fit: BoxFit.cover),
                ),
              );
            },
            progressIndicatorBuilder: (context, url, progress) {
              return Container(
                color: AppColors.greyColor,
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    AppNavigator.goBack();
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.greyColor.withOpacity(0.5),
                    child:const Icon(Icons.arrow_back,color: Colors.black,),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: onTap,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.greyColor,
                    child: Image.asset(AppImages.camera, width: 20),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
