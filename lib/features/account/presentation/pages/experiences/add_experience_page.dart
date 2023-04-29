import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/models/experience.dart';
import 'package:tutors/core/widgets/loading_widget.dart';
import 'package:tutors/features/account/presentation/cubit/account_cubit.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/locale_keys.g.dart';

class AddExperiencePage extends StatelessWidget {
  final Experience? experience;
  final bool isUpdate;
  final String docID;
  const AddExperiencePage(
      {super.key, this.experience, this.isUpdate = false, required this.docID});

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
                LocaleKeys.kAddExperience.tr(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: FormBuilder(
                  key: cubit.addExperienceKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        initialValue: experience?.title,
                        name: 'title',
                        decoration: InputDecoration(
                          labelText: "${LocaleKeys.kTitle.tr()} *",
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required<String>(
                            errorText: LocaleKeys.kRequiredField.tr(),
                          ),
                        ]),
                      ),
                      FormBuilderDropdown(
                        name: "type",
                        initialValue: experience?.type,
                        decoration: InputDecoration(
                          labelText: LocaleKeys.kEmploymentType.tr(),
                        ),
                        items: cubit.employmentType
                            .map((e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                      ),
                      FormBuilderTextField(
                        initialValue: experience?.company,
                        name: 'company',
                        decoration: InputDecoration(
                          labelText: LocaleKeys.kCompanyName.tr(),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required<String>(
                            errorText: LocaleKeys.kRequiredField.tr(),
                          ),
                        ]),
                      ),
                      FormBuilderTextField(
                        initialValue: experience?.location,
                        name: 'location',
                        decoration: InputDecoration(
                          labelText: LocaleKeys.kLocation.tr(),
                        ),
                      ),
                      FormBuilderDropdown(
                        name: "locationType",
                        initialValue: experience?.locationType,
                        decoration: InputDecoration(
                          labelText: LocaleKeys.kLocationType.tr(),
                        ),
                        items: cubit.locationType
                            .map((e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                      ),
                      FormBuilderCheckbox(
                        initialValue: experience?.isPresent,
                        name: "isPresent",
                        title: Text(
                          LocaleKeys.kImCurrentWorking.tr(),
                        ),
                        onChanged: (value) {
                          cubit.onChangedPresent(value);
                        },
                      ),
                      FormBuilderDateTimePicker(
                        name: "startDate",
                        initialValue: experience?.startDate,
                        inputType: InputType.date,
                        decoration: InputDecoration(
                          labelText: "${LocaleKeys.kStartDate.tr()} *",
                          suffixIcon: const Icon(Icons.date_range),
                        ),
                        valueTransformer: (value) =>
                            (value != null) ? Timestamp.fromDate(value) : null,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: LocaleKeys.kRequiredField.tr(),
                          ),
                        ]),
                      ),
                      const SizedBox(height: 15),
                      FormBuilderDateTimePicker(
                        enabled: state.isPresent == true ? false : true,
                        name: "endDate",
                        initialValue: experience?.startDate,
                        inputType: InputType.date,
                        decoration: InputDecoration(
                          labelText: "${LocaleKeys.kEndDate.tr()} *",
                          suffixIcon: const Icon(Icons.date_range),
                        ),
                        valueTransformer: (value) =>
                            (value != null) ? Timestamp.fromDate(value) : null,
                        validator: (state.isPresent == true)
                            ? null
                            : FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  errorText: LocaleKeys.kRequiredField.tr(),
                                ),
                              ]),
                      ),
                      FormBuilderTextField(
                        initialValue: experience?.location,
                        name: 'description',
                        decoration: InputDecoration(
                          labelText: LocaleKeys.kDescription.tr(),
                        ),
                      ),
                      if (isUpdate) ...[
                        const SizedBox(height: 15),
                        TextButton(
                            onPressed: () {
                              cubit.deleteExperience(
                                  experienceId: experience?.id ?? '');
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
                      context
                          .read<AccountCubit>()
                          .udateExperience(experienceId: experience?.id ?? '');
                    } else {
                      context.read<AccountCubit>().addExperience(docID: docID);
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
