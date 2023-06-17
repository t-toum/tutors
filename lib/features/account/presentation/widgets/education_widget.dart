import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/models/education.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/core/routes/route_path.dart';
import 'package:tutors/features/account/presentation/cubit/account_cubit.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../pages/educations/add_education_page.dart';
import 'components/education_component.dart';
import 'header_bar.dart';

class EducationWidget extends StatelessWidget {
  final List<Education> educations;
  final bool isSelf;
  const EducationWidget({
    super.key,
    this.educations = const [],
    required this.isSelf,
  });

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
              isSelf: isSelf,
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
                  EducationComponent(
                    education: education,
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
