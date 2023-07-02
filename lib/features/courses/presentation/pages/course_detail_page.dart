import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/constants/app_images.dart';
import 'package:tutors/core/extensions/date_time_extension.dart';
import 'package:tutors/core/models/course.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/core/routes/route_path.dart';
import 'package:tutors/core/widgets/loading_widget.dart';
import 'package:tutors/features/courses/presentation/cubit/course_cubit.dart';

import '../../../../core/params/account_param.dart';
import '../../../../generated/locale_keys.g.dart';
import '../widgets/course_field.dart';
import '../widgets/image_widget.dart';
import '../widgets/instructor_widget.dart';

class CourseDetailPage extends StatelessWidget {
  final Course course;
  const CourseDetailPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: AppColors.secondaryColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 25,
                decoration: const BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage(AppImages.favorite))),
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<CourseCubit, CourseState>(
        builder: (context, state) {
          if (state.status == DataStatus.loading) {
            return const LoadingWidget();
          }
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Image view
                      ImageWidget(url: course.imageUrl),
                      const SizedBox(height: 15),
                      Text(
                        course.title ?? '',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        course.category ?? '',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 10),
                      CourseField(
                        icon: Icons.account_circle_outlined,
                        text:
                            "${course.users?.firstName} ${course.users?.lastName}",
                      ),
                      const SizedBox(height: 5),
                      CourseField(
                        icon: Icons.pin_drop_outlined,
                        text: course.location ?? '',
                      ),
                      const SizedBox(height: 5),
                      const CourseField(
                        icon: Icons.access_time_sharp,
                        text: "60 Days",
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                              " ${LocaleKeys.kStart.tr()}: ${course.startDate?.shortDate()}",
                              style: Theme.of(context).textTheme.bodySmall),
                          const SizedBox(width: 3),
                          const Text("-"),
                          const SizedBox(width: 3),
                          Text("${course.endDate?.shortDate()}",
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        LocaleKeys.kDescription.tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 5),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: 50,
                          minWidth: double.infinity,
                          maxWidth: double.infinity,
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(course.description ?? '-'),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        LocaleKeys.kInStructor.tr(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 10),
                      InstructorWidget(
                        user: course.users,
                        onTap: () {
                          AppNavigator.navigateTo(RoutePath.accountRoute,
                              params: AccountParams(
                                  isSelf: false, userId: course.userId ?? ''));
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              if (state.currentUser?.role == "student") ...[
                InkWell(
                  onTap: () {
                    AppNavigator.navigateTo(
                      RoutePath.registerRoute,
                      params: course,
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    color: AppColors.primaryColor,
                    height: 50,
                    child: Center(
                      child: Text(
                        LocaleKeys.kRegister.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ],
          );
        },
      ),
    );
  }
}
