import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/core/routes/route_path.dart';
import 'package:tutors/features/account/presentation/pages/skills/add_skill_page.dart';

import '../../../../generated/locale_keys.g.dart';
import '../cubit/account_cubit.dart';
import 'header_bar.dart';

class SkillsWidget extends StatelessWidget {
  final List<String> skills;
  const SkillsWidget({super.key, this.skills = const []});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderBar(
              title: LocaleKeys.kSkills.tr(),
              onEdit: () {
                AppNavigator.navigateTo(RoutePath.skillsRoute);
              },
              addNew: () {
                AppNavigator.openModalBottomSheet(
                  body: BlocProvider<AccountCubit>.value(
                    value: context.read<AccountCubit>(),
                    child: const AddSkillPage(),
                  ),
                  title: '',
                );
              },
            ),
            const SizedBox(height: 10),
            ...skills.map((skill) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    skill,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Divider(thickness: 2),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
