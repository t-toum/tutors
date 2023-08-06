import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/extensions/date_time_extension.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/core/routes/route_path.dart';
import 'package:tutors/core/widgets/loading_widget.dart';
import 'package:tutors/features/my_courses/presentation/cubit/my_course_cubit.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../../../../core/constants/app_constants.dart';
import '../widgets/my_course_item.dart';

class MyCoursePage extends StatelessWidget {
  const MyCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyCourseCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.kMyCourse.tr(),
        ),
      ),
      body: BlocBuilder<MyCourseCubit, MyCourseState>(
        builder: (context, state) {
          if (state.status == DataStatus.loading) {
            return const LoadingWidget();
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: (state.currentUser?.role == UserRole.teacher)
                ? Column(
                    children: state.listCourse?.map((item) {
                          return MyCourseItem(
                            course: item,
                            onTap: () async {
                              final data =
                                  await AppNavigator.navigateCallbackData(
                                      RoutePath.myCourseDetailRoute,
                                      params: item);
                              if (data == true) {
                                await cubit.getCurrentUser();
                                await cubit.getCreatedCourse();
                              }
                            },
                          );
                        }).toList() ??
                        [
                          Center(
                            child: Text(LocaleKeys.kNoData.tr()),
                          )
                        ],
                  )
                : Column(
                    children: state.myCourses?.map((item) {
                          return Card(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.course?.title ?? ''),
                                    Text("Status: ${item.status}"),
                                    Text(
                                        "Register data: ${item.createdDate.shortDate()}"),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList() ??
                        [],
                  ),
          );
        },
      ),
    );
  }
}
