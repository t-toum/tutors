import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../generated/locale_keys.g.dart';
import '../constants/app_colors.dart';

class AppNavigator {
  static GlobalKey<NavigatorState>? navigatorKey;
  static AppNavigator? _instance;

  AppNavigator._() {
    // initialization and stuff
    navigatorKey = GlobalKey<NavigatorState>();
  }

  factory AppNavigator() {
    _instance ??= AppNavigator._();
    // since you are sure you will return non-null value, add '!' operator
    return _instance!;
  }

  static void navigateTo(String routeName, {dynamic params}) {
    navigatorKey!.currentState?.pushNamed(routeName, arguments: params);
  }

  static void goBack() {
    navigatorKey!.currentState!.pop();
  }

  static void goBackUntil(String routeName) {
    navigatorKey!.currentState!.popUntil(ModalRoute.withName(routeName));
  }

  static dynamic pushAndRemoveUntil(String routeName, {dynamic params}) {
    navigatorKey!.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: params,
    );
  }

  static void goBackWithData({dynamic data}) {
    navigatorKey!.currentState!.pop(data);
  }

  static dynamic openModalImagePicker(
      {Function()? onCamera, Function()? onGallery}) async {
    showMaterialModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      bounce: true,
      context: navigatorKey!.currentContext!,
      builder: (context) => Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 3,
                  width: 20,
                  decoration: BoxDecoration(
                      color: AppColors.greyColor,
                      borderRadius: BorderRadius.circular(8)),
                ),
              ],
            ),
            ListTile(
              onTap: onCamera,
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.camera_alt,
                  size: 15,
                ),
              ),
              title: Text(LocaleKeys.kFromCamera.tr()),
            ),
            const Divider(),
            ListTile(
              onTap: onGallery,
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.photo_camera_back_rounded,
                  size: 15,
                ),
              ),
              title: Text(LocaleKeys.kFromGallery.tr()),
            ),
          ],
        ),
      ),
    );
  }

  static dynamic openModalBottomSheet({required Widget body,required String title}) {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      enableDrag: false,
      context: navigatorKey!.currentContext!,
      builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.secondaryColor,
          appBar: AppBar(
            elevation: 0,
            title: Text(title,style: Theme.of(context).textTheme.titleSmall,),
            foregroundColor: Colors.black,
            backgroundColor: AppColors.secondaryColor,
            leading: IconButton(
              onPressed: () {
                AppNavigator.goBack();
              },
              icon: const Icon(Icons.close, color: Colors.black),
            ),
          ),
          body:body,
        );
      },
    );
  }

}
