import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/extensions/bool_extension.dart';
import 'package:tutors/core/extensions/date_time_extension.dart';
import 'package:tutors/core/widgets/loading_widget.dart';
import 'package:tutors/features/my_courses/presentation/cubit/my_course_cubit.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../../../../core/constants/app_constants.dart';

class MyCoursePage extends StatelessWidget {
  const MyCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.kMyCourse.tr(),
        ),
      ),
      body: BlocBuilder<MyCourseCubit, MyCourseState>(
        builder: (context, state) {
          if(state.status ==DataStatus.loading){
            return const LoadingWidget();
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: (state.currentUser?.role == UserRole.teacher)
                ? Column(
                    children: state.listCourse?.map((item) {
                          return Card(
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title ?? '',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    item.subject ?? '',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        item.status.getStatus,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: item.status
                                                    ? Colors.green
                                                    : Colors.red),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
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
