import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tutors/core/extensions/date_time_extension.dart';
import 'package:tutors/core/models/course.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/avatar_widget.dart';
import '../../../../generated/locale_keys.g.dart';
import 'course_field.dart';

class CourseItem extends StatelessWidget {
  final Course course;
  final Function()? onPressed;
  final bool isFavorite;
  final bool isStudent;
  const CourseItem(
      {super.key,
      required this.course,
      this.onPressed,
      this.isFavorite = false,
      this.isStudent = false});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: course.imageUrl ?? AppImages.defaultImage,
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                );
              },
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.title ?? '',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          course.category ?? '',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 5),

                        //User info
                        Row(
                          children: [
                            AvatarWidget(
                              imageUrl: course.users?.profileUrl ?? "",
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "${course.users?.firstName} ${course.users?.lastName} ",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        CourseField(
                          icon: Icons.pin_drop_outlined,
                          text: course.location ?? '',
                        ),
                        const SizedBox(height: 5),
                        const CourseField(
                          icon: Icons.access_time_sharp,
                          text: "- Days",
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          course.createdDate.shortDate(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        if (isStudent) ...[
                          (isFavorite)
                              ? Image.asset(
                                  AppImages.favoriteRed,
                                  width: 25,
                                )
                              : Image.asset(
                                  AppImages.heart,
                                  width: 25,
                                ),
                        ]
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
