import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tutors/core/extensions/date_time_extension.dart';
import 'package:tutors/core/models/experience.dart';

import '../../../../core/widgets/avatar_widget.dart';
import '../../../../generated/locale_keys.g.dart';

class ExperienceComponent extends StatelessWidget {
  final Experience? experience;
  final Function()? onTap;
  const ExperienceComponent({super.key, this.experience,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvatarWidget(
            isCircle: false,
            imageUrl: experience?.imageUrl ?? '',
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  experience?.title ?? '',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  "${experience?.company ?? ''}. ${experience?.type ?? ''}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                experience?.isPresent == true
                    ? Text(
                        "${experience?.startDate?.shortDate()} - ${LocaleKeys.kPresent.tr()}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    : Text(
                        "${experience?.startDate?.shortDate()} - ${experience?.endDate?.shortDate()}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                Text(
                  "${experience?.location ?? ''}. ${experience?.locationType ?? ''}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  experience?.description ?? '',
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
