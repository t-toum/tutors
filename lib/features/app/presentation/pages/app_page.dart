import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/core/routes/route_path.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../../../../core/constants/app_images.dart';
import '../cubit/app_cubit.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppState>(
      listener: (context, state) {
        // if (state.isAuth) {
        //   AppNavigator.pushAndRemoveUntil(RoutePath.initRoute);
        // } else {
        //   AppNavigator.pushAndRemoveUntil(RoutePath.loginRoute);
        // }
      },
      child: Scaffold(
        backgroundColor: AppColors.secondaryColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    AppImages.appLogo,
                    width: 146,
                    height: 146,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    LocaleKeys.kWelcomeToTutors.tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    LocaleKeys.kFindTheRightWayToLearn.tr(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      LocaleKeys.kSignIn.tr(),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      AppNavigator.navigateTo(RoutePath.signUpRoute);
                    },
                    child: Text(
                      LocaleKeys.kSignUp.tr(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(LocaleKeys.kOr.tr()),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        side: const BorderSide(
                          color: AppColors.primaryColor,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {},
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.asset(AppImages.googleLogo),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 40,
                            child: Center(
                              child: Text(
                                LocaleKeys.kGoogle.tr(),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
