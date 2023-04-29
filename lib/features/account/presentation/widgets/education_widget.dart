import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/models/education.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/core/routes/route_path.dart';
import 'package:tutors/features/account/presentation/cubit/account_cubit.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../../../../core/widgets/avatar_widget.dart';
import '../pages/educations/add_education_page.dart';
import 'header_bar.dart';

class EducationWidget extends StatelessWidget {
  final List<Education> educations;
  const EducationWidget({super.key, this.educations = const []});

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
                  body: BlocProvider<AccountCubit>.value(
                    value: context.read<AccountCubit>(),
                    child: const AddEducationPage(),
                  ),
                  title: '',
                );
              },
            ),
            const SizedBox(height: 10),
            ...educations.map((education) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AvatarWidget(
                        isCircle: true,
                        imageUrl: education.imageUrl ?? '',
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              education.school ?? '',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            Text(
                              education.degree ?? '',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              "${education.startDate?.year} - ${education.endDate?.year}",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              "${LocaleKeys.kGrade} : ${education.grade}",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              "${LocaleKeys.kActivitiesAndSocieties.tr()}: ${education.acctivities}",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              education.description ?? '',
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
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
