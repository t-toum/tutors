import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/constants/app_images.dart';
import 'package:tutors/core/widgets/loading_widget.dart';
import 'package:tutors/features/my_courses/presentation/cubit/my_course_cubit.dart';
import 'package:tutors/generated/locale_keys.g.dart';

class MyCourseDetailPage extends StatelessWidget {
  const MyCourseDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCourseCubit, MyCourseState>(
      builder: (context, state) {
        if (state.status == DataStatus.loading) {
          return const LoadingWidget();
        }
        final course = state.course;
        return Scaffold(
          appBar: AppBar(
            title: Text(course?.title ?? ''),
            actions: [
              PopupMenuButton(
                offset: const Offset(0, 45),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: Text(LocaleKeys.kUpdate.tr()),
                      onTap: () {},
                    ),
                    PopupMenuItem(
                      child: Text(LocaleKeys.kClose.tr()),
                    ),
                    PopupMenuItem(child: Text(LocaleKeys.kDelete.tr())),
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
                  padding:const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course?.subject ?? '',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(height: 20,),
                      Text("Register"),
                      Divider(),
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
