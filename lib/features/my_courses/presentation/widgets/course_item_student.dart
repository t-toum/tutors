import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tutors/core/extensions/date_time_extension.dart';
import 'package:tutors/core/models/registation.dart';

import '../../../../generated/locale_keys.g.dart';
import 'image_course_wiget.dart';

class CourseItemStudent extends StatelessWidget {
  final Registation? item;
  final Function()? onTap;
  const CourseItemStudent({super.key, this.item,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageCourseWidget(
                url: item?.course?.imageUrl,
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item?.course?.title ?? '',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item?.course?.subject ?? '',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item?.course?.category ?? '',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item?.course?.location ?? '',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${LocaleKeys.kStartDate.tr()}: ${item?.course?.startDate.shortDate()}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
