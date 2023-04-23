import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/models/experience.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/core/routes/route_path.dart';
import 'package:tutors/features/account/presentation/cubit/account_cubit.dart';

import '../../../../generated/locale_keys.g.dart';
import '../components/experience_component.dart';
import '../pages/experiences/add_experience_page.dart';
import 'header_bar.dart';

class ExperienceWidget extends StatelessWidget {
  final List<Experience>? experiences;
  const ExperienceWidget({super.key, this.experiences});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        return Card(
          margin: EdgeInsets.zero,
          child: Container(
            padding: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                HeaderBar(
                  addNew: () {
                    AppNavigator.openModalBottomSheet(
                        body: BlocProvider<AccountCubit>.value(
                          value: context.read<AccountCubit>(),
                          child: const AddExperiencePage(),
                        ),
                        title: '');
                  },
                  onEdit: () {
                    AppNavigator.navigateTo(RoutePath.editExperienceRoute);
                  },
                  title: LocaleKeys.kExperence.tr(),
                ),
                const SizedBox(height: 10),
                ...experiences?.map((experience) {
                      return Column(
                        children: [
                          ExperienceComponent(
                            experience: experience,
                          ),
                          const Divider(
                            thickness: 2,
                          )
                        ],
                      );
                    }).toList() ??
                    [],
              ],
            ),
          ),
        );
      },
    );
  }
}
