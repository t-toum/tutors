import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/widgets/loading_widget.dart';
import 'package:tutors/features/account/presentation/cubit/account_cubit.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../../../../core/widgets/custom_button.dart';

class AccountEditInfoPage extends StatelessWidget {
  const AccountEditInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        if (state.status == DataStatus.loading) {
          return const LoadingWidget();
        }
        return FormBuilder(
          key: context.read<AccountCubit>().editInfoKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FormBuilderTextField(
                          initialValue: state.currentUser?.firstName,
                          name: 'firstName',
                          decoration: InputDecoration(
                            labelText: "${LocaleKeys.kFirstname.tr()} *",
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required<String>(
                              errorText: LocaleKeys.kRequiredField.tr(),
                            ),
                          ]),
                        ),
                        FormBuilderTextField(
                          name: 'lastName',
                          initialValue: state.currentUser?.lastName,
                          decoration: InputDecoration(
                            labelText: "${LocaleKeys.kLastname.tr()} *",
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required<String>(
                              errorText: LocaleKeys.kRequiredField.tr(),
                            ),
                          ]),
                        ),
                        FormBuilderDropdown(
                          name: "gender",
                          initialValue: state.currentUser?.gender,
                          decoration: InputDecoration(
                            labelText: "${LocaleKeys.kGender.tr()} *",
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: LocaleKeys.kRequiredField.tr(),
                            ),
                          ]),
                          items: context
                              .read<AccountCubit>()
                              .genders
                              .map((e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                        ),
                        FormBuilderDateTimePicker(
                          name: "birthDay",
                          initialValue: state.currentUser?.birthDay,
                          inputType: InputType.date,
                          decoration: InputDecoration(
                              labelText: LocaleKeys.kBirthday.tr(),
                              suffixIcon: const Icon(Icons.date_range)),
                        ),
                        FormBuilderTextField(
                          name: 'address',
                          initialValue: state.currentUser?.address,
                          decoration: InputDecoration(
                            labelText: LocaleKeys.kAddress.tr(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          LocaleKeys.kJobInfo.tr(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 15),
                        FormBuilderTextField(
                          name: 'jobTitle',
                          initialValue: state.currentUser?.jobTitle,
                          decoration: InputDecoration(
                            labelText: LocaleKeys.kJobTitle.tr(),
                          ),
                        ),
                        FormBuilderTextField(
                          name: 'position',
                          initialValue: state.currentUser?.position,
                          decoration: InputDecoration(
                            labelText: LocaleKeys.kCurrentPosition.tr(),
                          ),
                        ),
                        FormBuilderTextField(
                          name: 'industry',
                          initialValue: state.currentUser?.industry,
                          decoration: InputDecoration(
                            labelText: LocaleKeys.kIndustry.tr(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          LocaleKeys.kLocation.tr(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 15),
                        FormBuilderTextField(
                          name: 'country',
                          initialValue: state.currentUser?.country,
                          decoration: InputDecoration(
                            labelText:
                                "${LocaleKeys.kCountry.tr()}/${LocaleKeys.kRegion.tr()}",
                          ),
                        ),
                        FormBuilderTextField(
                          name: 'city',
                          initialValue: state.currentUser?.city,
                          decoration: InputDecoration(
                            labelText: LocaleKeys.kCity.tr(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          LocaleKeys.kContactInfo.tr(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 15),
                        FormBuilderTextField(
                          name: 'email',
                          initialValue: state.currentUser?.email,
                          decoration: InputDecoration(
                            labelText: LocaleKeys.kEmail.tr(),
                          ),
                        ),
                        FormBuilderTextField(
                          name: 'phone',
                          initialValue: state.currentUser?.phone,
                          decoration: InputDecoration(
                            labelText: LocaleKeys.kPhoneNumber.tr(),
                          ),
                        ),
                        const SizedBox(height: 20)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: CustomButton(
                    onPressed: () {
                      context.read<AccountCubit>().updateUserInfo();
                    },
                    textButton: LocaleKeys.kSave.tr(),
                  ),
                ),
                const SizedBox(height: 15)
              ],
            ),
          ),
        );
      },
    );
  }
}
