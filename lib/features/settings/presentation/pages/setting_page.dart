import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/constants/app_images.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/core/routes/route_path.dart';
import 'package:tutors/generated/locale_keys.g.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: Text(
            LocaleKeys.kSettings.tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  AppNavigator.navigateTo(RoutePath.accountRoute);
                },
                leading: Image.asset(AppImages.account, width: 20),
                title: Text(LocaleKeys.kAccount.tr()),
              ),
              const Divider(thickness: 1),
              ListTile(
                onTap: () {},
                leading: Image.asset(AppImages.globe, width: 20),
                title: Text(LocaleKeys.kLanguage.tr()),
              ),
              const Divider(thickness: 1),
              ListTile(
                onTap: () {},
                leading: Image.asset(AppImages.lock, width: 20),
                title: Text(LocaleKeys.kSecurity.tr()),
              ),
              const Divider(thickness: 1),
              ListTile(
                onTap: () {},
                leading: Image.asset(AppImages.power, width: 20),
                title: Text(LocaleKeys.kSignOut.tr()),
              ),
            ],
          ),
        ));
  }
}
