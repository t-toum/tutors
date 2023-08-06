import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/constants/app_images.dart';
import 'package:tutors/core/extensions/date_time_extension.dart';
import 'package:tutors/core/models/course.dart';
import 'package:tutors/generated/locale_keys.g.dart';

class MyCourseItem extends StatelessWidget {
  final Function()? onTap;
  final Course? course;
  const MyCourseItem({super.key, this.onTap, this.course});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: course?.imageUrl ?? AppImages.defaultImage,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                        color: AppColors.greyColor,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  );
                },
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course?.title ?? '',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    course?.subject ?? '',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    course?.category ?? '',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${course?.maximum}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${course?.startDate.shortDate()} - ${course?.endDate.shortDate()}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              )),
              if (course?.status == false)
                Text(
                  LocaleKeys.kClosed.tr(),
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              if (course?.status == true)
                Text(
                  LocaleKeys.kOpen.tr(),
                  style: const TextStyle(
                    color: Colors.green,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
