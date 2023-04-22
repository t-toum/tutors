import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tutors/core/models/education.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/core/routes/route_path.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../../../../core/widgets/avatar_widget.dart';
import '../pages/educations/add_education_page.dart';
import 'header_bar.dart';

class EducationWidget extends StatelessWidget {
  final List<Education> education;
  const EducationWidget({super.key, this.education = const []});

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
              title: LocaleKeys.kEducation.tr(),
              onEdit: () {
                AppNavigator.navigateTo(RoutePath.educationRoute);
              },
              addNew: () {
                AppNavigator.openModalBottomSheet(
                    body: AddEducationPage(), title: "Add education");
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AvatarWidget(
                  isCircle: true,
                  imageUrl:
                      'https://upload.wikimedia.org/wikipedia/en/5/52/Logo-nuol.gif',
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "National University of Laos",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        "Bachelor's degree, Computer Programming",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "2016 - 2020",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Grade: B+",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Activities and societies: Football",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Description",
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
                  isCircle: true,
                  imageUrl:
                      "https://upload.wikimedia.org/wikipedia/en/5/52/Logo-nuol.gif",
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "National University of Laos",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        "Bachelor's degree, Computer Programming",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "2016 - 2020",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Grade: B+",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Activities and societies: Football",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "Description",
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
