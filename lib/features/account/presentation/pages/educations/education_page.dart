import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/constants/app_images.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/features/account/presentation/cubit/account_cubit.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../../widgets/components/education_component.dart';
import 'add_education_page.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AccountCubit>();
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          LocaleKeys.kEducation.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                AppNavigator.openModalBottomSheet(
                    body: BlocProvider<AccountCubit>.value(
                      value: cubit,
                      child: const AddEducationPage(),
                    ),
                    title: "Add education");
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
      body: BlocBuilder<AccountCubit, AccountState>(
        builder: (context, state) {
          if (state.status == DataStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: state.currentUser?.educations?.map((education) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            EducationComponent(
                              education: education,
                              onTap: () {
                                AppNavigator.openModalBottomSheet(
                                  body: BlocProvider<AccountCubit>.value(
                                    value: context.read<AccountCubit>(),
                                    child: AddEducationPage(
                                      isUpdate: true,
                                      education: education,
                                    ),
                                  ),
                                  title: '',
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList() ??
                  [],
            ),
          );
        },
      ),
    );
  }
}
