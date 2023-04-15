import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/widgets/not_found_page.dart';
import 'package:tutors/features/home/presentation/cubit/home_cubit.dart';
import 'package:tutors/features/home/presentation/pages/home_page.dart';

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
                switch (state.currentTab){
                  case 0:
                    return const HomePage();
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
                    width: 30,
                    height: 30,
                  ),
                  label: LocaleKeys.kCourses.tr(),
                  
                  icon: Image.asset(
                    AppImages.book,
                    width: 30,
                    height: 30,
                  ),
                  tooltip: LocaleKeys.kCourses.tr(),
                ),
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    AppImages.bubbleActive,
                    width: 30,
                    height: 30,
                  ),
                  label: LocaleKeys.kChat.tr(),
                  icon: Image.asset(
                    AppImages.bubble,
                    width: 30,
                    height: 30,
                  ),
                  tooltip: LocaleKeys.kChat.tr(),
                ),
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    AppImages.myCourseActive,
                    width: 30,
                    height: 30,
                  ),
                  label: LocaleKeys.kMyCourse.tr(),
                  icon: Image.asset(
                    AppImages.myCourse,
                    width: 30,
                    height: 30,
                  ),
                  tooltip: LocaleKeys.kMyCourse.tr(),
                ),
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    AppImages.favoriteActive,
                    width: 30,
                    height: 30,
                  ),
                  label: LocaleKeys.kFavorites.tr(),
                  icon: Image.asset(
                    AppImages.favorite,
                    width: 30,
                    height: 30,
                  ),
                  tooltip: LocaleKeys.kFavorites.tr(),
                ),
                BottomNavigationBarItem(
                  activeIcon: Image.asset(
                    AppImages.accountActive,
                    width: 30,
                    height: 30,
                  ),
                  label: LocaleKeys.kAccount.tr(),
                  icon: Image.asset(
                    AppImages.account,
                    width: 30,
                    height: 30,
                  ),
                  tooltip: LocaleKeys.kAccount.tr(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
