import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/widgets/loading_widget.dart';
import 'package:tutors/features/account/presentation/cubit/account_cubit.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../../../../../core/constants/app_images.dart';
import '../../../../../core/navigator/app_navigator.dart';
import 'add_skill_page.dart';

class SkillsPage extends StatelessWidget {
  const SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        if (state.status == DataStatus.loading) {
          return const LoadingWidget();
        }
        return Scaffold(
          backgroundColor: AppColors.secondaryColor,
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: Text(
              LocaleKeys.kSkills.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    AppNavigator.openModalBottomSheet(
                      body: BlocProvider<AccountCubit>.value(
                        value: context.read<AccountCubit>(),
                        child: const AddSkillPage(),
                      ),
                      title: '',
                    );
                  },
                  child: Image.asset(
                    AppImages.plusGrey,
                    width: 25,
                    height: 25,
                  ),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: state.currentUser?.skills?.map((skill) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(skill),
                          trailing: InkWell(
                            onTap: () async {
                              await context
                                  .read<AccountCubit>()
                                  .deleteSkill(skill: skill);
                            },
                            child: const Icon(Icons.delete),
                          ),
                        ),
                        const Divider()
                      ],
                    );
                  }).toList() ??
                  [],
            ),
          ),
        );
      },
    );
  }
}
