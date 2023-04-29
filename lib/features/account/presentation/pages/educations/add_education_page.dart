import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tutors/core/models/education.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../cubit/account_cubit.dart';

class AddEducationPage extends StatelessWidget {
  final bool isUpdate;
  final Education? education;
  const AddEducationPage({super.key, this.isUpdate = false, this.education});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AccountCubit>();
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        if (state.status == DataStatus.loading) {
          return const LoadingWidget();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.kAddEducation.tr(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: FormBuilder(
                  key: cubit.addEducationKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        initialValue: education?.school,
                        name: 'shool',
                        decoration: InputDecoration(
                          labelText: "${LocaleKeys.kSchool.tr()} *",
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required<String>(
                            errorText: LocaleKeys.kRequiredField.tr(),
                          ),
                        ]),
                      ),
                      FormBuilderTextField(
                        initialValue: education?.degree,
                        name: 'degree',
                        decoration: InputDecoration(
                          labelText: LocaleKeys.kDegree.tr(),
                        ),
                      ),
                      FormBuilderTextField(
                        initialValue: education?.fieldStudy,
                        name: 'fieldOfStudy',
                        decoration: InputDecoration(
                          labelText: LocaleKeys.kFieldOfStudy.tr(),
                        ),
                      ),
                      FormBuilderDateTimePicker(
                        name: "startDate",
                        initialValue: education?.startDate,
                        inputType: InputType.date,
                        decoration: InputDecoration(
                          labelText: LocaleKeys.kStartDate.tr(),
                          suffixIcon: const Icon(Icons.date_range),
                        ),
                        valueTransformer: (value) =>
                            (value != null) ? Timestamp.fromDate(value) : null,
                      ),
                      const SizedBox(height: 15),
                      FormBuilderDateTimePicker(
                        name: "endDate",
                        initialValue: education?.startDate,
                        inputType: InputType.date,
                        decoration: InputDecoration(
                          labelText: LocaleKeys.kEndDate.tr(),
                          suffixIcon: const Icon(Icons.date_range),
                        ),
                        valueTransformer: (value) =>
                            (value != null) ? Timestamp.fromDate(value) : null,
                      ),
                      FormBuilderTextField(
                        initialValue: education?.grade,
                        name: 'grade',
                        decoration: InputDecoration(
                          labelText: LocaleKeys.kGrade.tr(),
                        ),
                      ),
                      FormBuilderTextField(
                        initialValue: education?.acctivities,
                        name: 'acctivities',
                        decoration: InputDecoration(
                          labelText: LocaleKeys.kActivitiesAndSocieties.tr(),
                        ),
                      ),
                      FormBuilderTextField(
                        initialValue: education?.description,
                        name: 'description',
                        decoration: InputDecoration(
                          labelText: LocaleKeys.kDescription.tr(),
                        ),
                      ),
                      if (isUpdate) ...[
                        const SizedBox(height: 15),
                        TextButton(
                            onPressed: () {
                              // cubit.deleteExperience(
                              //     experienceId: experience?.id ?? '');
                            },
                            child: Text(
                              LocaleKeys.kDeleteExperiene.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Colors.grey,
                                  ),
                            ))
                      ]
                    ],
                  ),
                ),
              )),
              const SizedBox(height: 15),
              SizedBox(
                height: 50,
                child: CustomButton(
                  onPressed: () {
                    if (isUpdate) {
                      // context
                      //     .read<AccountCubit>()
                      //     .udateExperience(experienceId: experience?.id ?? '');
                    } else {
                      context.read<AccountCubit>().addEducation();
                    }
                  },
                  textButton: LocaleKeys.kSave.tr(),
                ),
              ),
              const SizedBox(height: 15)
            ],
          ),
        );
      },
    );
  }
}
