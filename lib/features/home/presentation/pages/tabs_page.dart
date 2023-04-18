import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/DI/service_locator.dart';
import 'package:tutors/core/widgets/not_found_page.dart';
import 'package:tutors/features/courses/presentation/cubit/course_cubit.dart';
import 'package:tutors/features/courses/presentation/pages/courses_page.dart';
import 'package:tutors/features/home/presentation/cubit/home_cubit.dart';
import 'package:tutors/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:tutors/features/settings/presentation/pages/setting_page.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../generated/locale_keys.g.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 5,
          child: Scaffold(
            body: Builder(
              builder: (context) {
                switch (state.currentTab) {
                  case 0:
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider<CourseCubit>(
                          create: (context) => getIt<CourseCubit>(),
                        ),
                      ],
                      child: const CoursePage(),
                    );
                  case 4:
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider<SettingCubit>(
                          create: (context) => getIt<SettingCubit>(),
                        ),
                      ],
                      child: const SettingPage(),
                    );
                  default:
                    return const PageNotFound();
                }
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              currentIndex: state.currentTab,
              onTap: (index) {
                context.read<HomeCubit>().onChangedTab(index);
              },
              items: [
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    AppImages.bookActive,
                    width: 20,
                    height: 20,
                  ),
                  label: LocaleKeys.kCourses.tr(),
                  icon: Image.asset(
                    AppImages.book,
                    width: 20,
                    height: 20,
                  ),
                  tooltip: LocaleKeys.kCourses.tr(),
                ),
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    AppImages.bubbleActive,
                    width: 20,
                    height: 20,
                  ),
                  label: LocaleKeys.kChat.tr(),
                  icon: Image.asset(
                    AppImages.bubble,
                    width: 20,
                    height: 20,
                  ),
                  tooltip: LocaleKeys.kChat.tr(),
                ),
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    AppImages.myCourseActive,
                    width: 20,
                    height: 20,
                  ),
                  label: LocaleKeys.kMyCourse.tr(),
                  icon: Image.asset(
                    AppImages.myCourse,
                    width: 20,
                    height: 20,
                  ),
                  tooltip: LocaleKeys.kMyCourse.tr(),
                ),
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    AppImages.favoriteActive,
                    width: 20,
                    height: 20,
                  ),
                  label: LocaleKeys.kFavorites.tr(),
                  icon: Image.asset(
                    AppImages.favorite,
                    width: 20,
                    height: 20,
                  ),
                  tooltip: LocaleKeys.kFavorites.tr(),
                ),
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    AppImages.settingsActive,
                    width: 20,
                    height: 20,
                  ),
                  label: LocaleKeys.kSettings.tr(),
                  icon: Image.asset(
                    AppImages.settings,
                    width: 20,
                    height: 20,
                  ),
                  tooltip: LocaleKeys.kSettings.tr(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
