import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/avatar_widget.dart';
import '../../../../generated/locale_keys.g.dart';
import 'header_bar.dart';

class ExperienceWidget extends StatelessWidget {
  const ExperienceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            HeaderBar(
              title: LocaleKeys.kExperence.tr(),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AvatarWidget(
                  isCircle: false,
                  imageUrl: '',
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Assistant",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        "Company. Full-time",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Apr 2020 - Present. 3yrs 1 mon",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Laos. On-site",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Position description",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AvatarWidget(
                  isCircle: false,
                  imageUrl: '',
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Assistant",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        "Company. Full-time",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Apr 2020 - Present. 3yrs 1 mon",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Laos. On-site",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Position description",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
