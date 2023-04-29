import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/constants/app_images.dart';
import 'package:tutors/core/widgets/loading_widget.dart';
import 'package:tutors/features/account/presentation/cubit/account_cubit.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../../../../../core/navigator/app_navigator.dart';
import '../../widgets/components/experience_component.dart';
import 'add_experience_page.dart';

class EditExperiencePage extends StatelessWidget {
  const EditExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      buildWhen: (previous, current) =>
          previous.currentUser != current.currentUser,
      builder: (context, state) {
        if (state.status == DataStatus.loading) {
          return const LoadingWidget();
        }
        return Scaffold(
          backgroundColor: AppColors.secondaryColor,
          appBar: AppBar(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            title: Text(
              LocaleKeys.kExperence.tr(),
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
                          child: AddExperiencePage(
                            docID: state.currentUser?.id ?? '',
                          ),
                        ),
                        title: '');
                  },
                  child: Image.asset(
                    AppImages.plusGrey,
                    width: 25,
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: state.currentUser?.experiences?.map((experience) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: ExperienceComponent(
                          experience: experience,
                          onTap: () {
                            AppNavigator.openModalBottomSheet(
                                body: BlocProvider<AccountCubit>.value(
                                  value: context.read<AccountCubit>(),
                                  child: AddExperiencePage(
                                    isUpdate: true,
                                    experience: experience,
                                    docID: state.currentUser?.id ?? '',
                                  ),
                                ),
                                title: '');
                          },
                        ),
                      ),
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
