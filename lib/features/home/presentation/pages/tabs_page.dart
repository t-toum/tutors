import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/DI/service_locator.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/core/routes/route_path.dart';
import 'package:tutors/core/widgets/not_found_page.dart';
import 'package:tutors/features/courses/presentation/cubit/course_cubit.dart';
import 'package:tutors/features/courses/presentation/pages/courses_page.dart';
import 'package:tutors/features/home/presentation/cubit/home_cubit.dart';
import 'package:tutors/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:tutors/features/settings/presentation/pages/setting_page.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../generated/locale_keys.g.dart';
import '../widgets/tab_item.dart';

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
                    case 5:
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
              floatingActionButton: state.currentUser?.role == "teacher"
                  ? FloatingActionButton(
                      child: const Icon(Icons.add),
                      onPressed: () {
                        AppNavigator.navigateTo(RoutePath.addCourseRoute);
                      },
                    )
                  : null,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: 10,
                child: SizedBox(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TabItem(
                          onPressed: () {
                            context.read<HomeCubit>().onChangedTab(0);
                          },
                          active: state.currentTab == 0,
                          icon: Image.asset(
                            AppImages.book,
                            width: 25,
                            height: 25,
                          ),
                          activeIcon: Image.asset(
                            AppImages.bookActive,
                            width: 25,
                            height: 25,
                          ),
                          title: LocaleKeys.kCourses.tr(),
                        ),
                        TabItem(
                          onPressed: () {
                            context.read<HomeCubit>().onChangedTab(1);
                          },
                          active: state.currentTab == 1,
                          icon: Image.asset(
                            AppImages.bubble,
                            width: 25,
                            height: 25,
                          ),
                          activeIcon: Image.asset(
                            AppImages.bubbleActive,
                            width: 25,
                            height: 25,
                          ),
                          title: LocaleKeys.kChat.tr(),
                        ),
                        if (state.currentUser?.role == 'teacher') ...[
                          const SizedBox(
                            width: 20,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                        TabItem(
                          onPressed: () {
                            context.read<HomeCubit>().onChangedTab(3);
                          },
                          active: state.currentTab == 3,
                          icon: Image.asset(
                            AppImages.myCourse,
                            width: 25,
                            height: 25,
                          ),
                          activeIcon: Image.asset(
                            AppImages.myCourseActive,
                            width: 25,
                            height: 25,
                          ),
                          title: LocaleKeys.kMyCourse.tr(),
                        ),
                        if (state.currentUser?.role == "student") ...[
                          TabItem(
                            onPressed: () {
                              context.read<HomeCubit>().onChangedTab(4);
                            },
                            active: state.currentTab == 4,
                            icon: Image.asset(
                              AppImages.favorite,
                              width: 25,
                              height: 25,
                            ),
                            activeIcon: Image.asset(
                              AppImages.favoriteActive,
                              width: 25,
                              height: 25,
                            ),
                            title: LocaleKeys.kFavorites.tr(),
                          ),
                        ],
                        TabItem(
                          onPressed: () {
                            context.read<HomeCubit>().onChangedTab(5);
                          },
                          active: state.currentTab == 5,
                          icon: Image.asset(
                            AppImages.settings,
                            width: 25,
                            height: 25,
                          ),
                          activeIcon: Image.asset(
                            AppImages.settingsActive,
                            width: 25,
                            height: 25,
                          ),
                          title: LocaleKeys.kSettings.tr(),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        );
      },
    );
  }
}
