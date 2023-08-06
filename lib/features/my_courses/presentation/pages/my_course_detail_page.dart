import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/constants/app_images.dart';
import 'package:tutors/core/extensions/course_extension.dart';
import 'package:tutors/core/extensions/date_time_extension.dart';
import 'package:tutors/core/models/registation.dart';
import 'package:tutors/core/widgets/loading_widget.dart';
import 'package:tutors/features/courses/domain/params/add_course_params.dart';
import 'package:tutors/features/my_courses/presentation/cubit/my_course_cubit.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../../../../core/navigator/app_navigator.dart';
import '../../../../core/routes/route_path.dart';
import '../widgets/detail_item.dart';
import '../widgets/register_item.dart';

class MyCourseDetailPage extends StatelessWidget {
  const MyCourseDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyCourseCubit>();
    return BlocBuilder<MyCourseCubit, MyCourseState>(
      buildWhen: (previous, current) =>
          previous.course != current.course ||
          previous.register != current.register,
      builder: (context, state) {
        if (state.status == DataStatus.loading) {
          return const LoadingWidget();
        }
        final course = state.course;
        return Scaffold(
          appBar: AppBar(
            title: Text(course?.title ?? ''),
            actions: [
              PopupMenuButton<int>(
                onSelected: (value) async {
                  switch (value) {
                    case 1:
                      final data = await AppNavigator.navigateCallbackData(
                        RoutePath.addCourseRoute,
                        params: AddCourseParams(
                            title: LocaleKeys.kUpdateCourse.tr(),
                            data: course?.toJsonWithoutConvert ?? {},
                            isUpdate: true),
                      );
                      if (data == true) {
                        await cubit.getCourseDetail(id: state.course?.id ?? '');
                        await cubit.getRegisterByCourse(
                            courseID: state.course?.id ?? '');
                      }
                      break;
                    case 2:
                      await cubit.updateCourseStatus(
                          status: false, couresID: state.course?.id ?? '');
                      break;
                    case 3:
                      await cubit.deleteCourse(state.course?.id ?? '');
                      break;
                  }
                },
                offset: const Offset(0, 45),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      value: 1,
                      child: Text(LocaleKeys.kUpdate.tr()),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text(LocaleKeys.kClose.tr()),
                    ),
                    PopupMenuItem(
                      value: 3,
                        child: Text(
                      LocaleKeys.kDelete.tr(),
                    )),
                  ];
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: course?.imageUrl ?? AppImages.defaultImage,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                          color: AppColors.greyColor,
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover)),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailItem(
                        title: LocaleKeys.kSubject.tr(),
                        content: course?.subject,
                      ),
                      DetailItem(
                        title: LocaleKeys.kCategory.tr(),
                        content: course?.category,
                      ),

                      DetailItem(
                        title: LocaleKeys.kMaximum.tr(),
                        content: course?.maximum.toString(),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${course?.startDate.shortDate()} - ${course?.endDate.shortDate()}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 8),
                      Text(LocaleKeys.kDescription.tr()),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.greyColor,
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: Text("${course?.description}"),
                      ),

                      //User Register
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(LocaleKeys.kRegister.tr()),
                          Text(
                              "${state.register?.length ?? 0}/${course?.maximum}"),
                        ],
                      ),
                      const Divider(),
                      BlocSelector<MyCourseCubit, MyCourseState,
                          List<Registation>>(
                        selector: (register) => register.register ?? [],
                        builder: (context, myRegister) {
                          return Column(
                            children: myRegister
                                .map(
                                  (item) => RegisterItem(item: item.user),
                                )
                                .toList(),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
