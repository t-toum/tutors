import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletons/skeletons.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/core/routes/route_path.dart';
import 'package:tutors/features/courses/presentation/cubit/course_cubit.dart';
import 'package:tutors/features/courses/presentation/widgets/search_text_field.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../../../../core/constants/app_images.dart';
import '../widgets/course_item.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CourseCubit>();
    return BlocBuilder<CourseCubit, CourseState>(
      buildWhen: (previous, current) =>
          previous.listCourse != current.listCourse,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.secondaryColor,
          appBar: AppBar(
            backgroundColor: AppColors.secondaryColor,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SearchTextField(
                controller: cubit.searchTextController,
                onReset: state.canReset
                    ? () {
                        cubit.onResetSearchTextfield();
                      }
                    : null,
              ),
            ),
            titleSpacing: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () async {
                    final filterData = await AppNavigator.navigateCallbackData(
                      RoutePath.filterCourse,
                      params: state.categories,
                    );
                    if (filterData != null) {
                      await cubit.filterCourse();
                    }
                  },
                  child: Image.asset(
                    AppImages.filter,
                    width: 20,
                  ),
                ),
              )
            ],
          ),
          body: Builder(builder: (context) {
            if (state.status == DataStatus.loading) {
              return Skeleton(
                isLoading: true,
                skeleton: SkeletonListView(),
                child: const SizedBox(),
              );
            } else {
              if (state.listCourse?.isNotEmpty == true) {
                return SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: state.listCourse?.map((course) {
                          return CourseItem(
                            course: course,
                            isFavorite: cubit.isFvorite(course.id ?? ''),
                            onPressed: () async {
                              await AppNavigator.navigateCallbackData(
                                  RoutePath.courseDetailRoute,
                                  params: course);
                              await cubit.getFavorite();
                              await cubit.getAllCourse();
                            },
                          );
                        }).toList() ??
                        [],
                  ),
                );
              } else {
                return Center(
                  child: Text(LocaleKeys.kNoData.tr()),
                );
              }
            }
          }),
        );
      },
    );
  }
}
