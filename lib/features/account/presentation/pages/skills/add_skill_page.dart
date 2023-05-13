import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/widgets/loading_widget.dart';
import 'package:tutors/features/account/presentation/cubit/account_cubit.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../../../../../core/widgets/custom_button.dart';

class AddSkillPage extends StatelessWidget {
  const AddSkillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<AccountCubit, AccountState>(
          builder: (context, state) {
            if(state.status == DataStatus.loading){
              return const LoadingWidget();
            }
            return FormBuilder(
              key: context.read<AccountCubit>().addSkillKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.kAddSkill.tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  FormBuilderTextField(
                    name: 'skill',
                    decoration: InputDecoration(
                      labelText: "${LocaleKeys.kSkills.tr()} *",
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required<String>(
                        errorText: LocaleKeys.kRequiredField.tr(),
                      ),
                    ]),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 40,
                    child: CustomButton(
                      onPressed: () {
                        context.read<AccountCubit>().addSkill();
                      },
                      textButton: LocaleKeys.kSave.tr(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
