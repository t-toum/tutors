import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/models/education.dart';
import '../../../../../core/widgets/avatar_widget.dart';
import '../../../../../generated/locale_keys.g.dart';

class EducationComponent extends StatelessWidget {
  final Education? education;
  final Function()? onTap;
  const EducationComponent({super.key, this.education, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvatarWidget(
            isCircle: true,
            imageUrl: education?.imageUrl ?? '',
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  education?.school ?? '',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  education?.degree ?? '',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "${education?.startDate?.year} - ${education?.endDate?.year}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "${LocaleKeys.kGrade} : ${education?.grade}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "${LocaleKeys.kActivitiesAndSocieties.tr()}: ${education?.acctivities}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  education?.description ?? '',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
