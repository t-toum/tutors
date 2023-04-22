import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tutors/core/models/users.dart';

import '../../../../../generated/locale_keys.g.dart';

class UserDetailPage extends StatelessWidget {
  final Users? user;
  const UserDetailPage({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormBuilderTextField(
            enabled: false,
            initialValue: user?.firstName,
            name: 'firstName',
            decoration: InputDecoration(
              labelText: LocaleKeys.kFirstname.tr(),
            ),
          ),
          FormBuilderTextField(
            enabled: false,
            name: 'lastName',
            initialValue: user?.lastName,
            decoration: InputDecoration(
              labelText: LocaleKeys.kLastname.tr(),
            ),
          ),
          FormBuilderDropdown(
            name: "gender",
            initialValue: user?.gender,
            decoration: InputDecoration(
              labelText: "${LocaleKeys.kGender.tr()} *",
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText: LocaleKeys.kRequiredField.tr(),
              ),
            ]),
            items: const [],
          ),
          FormBuilderDateTimePicker(
            enabled: false,
            name: "birthDay",
            initialValue: user?.birthDay,
            inputType: InputType.date,
            decoration: InputDecoration(
                labelText: LocaleKeys.kBirthday.tr(),
                suffixIcon: const Icon(Icons.date_range)),
          ),
          FormBuilderTextField(
            enabled: false,
            name: 'address',
            initialValue: user?.address,
            decoration: InputDecoration(
              labelText: LocaleKeys.kAddress.tr(),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            LocaleKeys.kJobInfo.tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 15),
          FormBuilderTextField(
            enabled: false,
            name: 'jobTitle',
            initialValue: user?.jobTitle,
            decoration: InputDecoration(
              labelText: LocaleKeys.kJobTitle.tr(),
            ),
          ),
          FormBuilderTextField(
            enabled: false,
            name: 'position',
            initialValue: user?.position,
            decoration: InputDecoration(
              labelText: LocaleKeys.kCurrentPosition.tr(),
            ),
          ),
          FormBuilderTextField(
            enabled: false,
            name: 'industry',
            initialValue: user?.industry,
            decoration: InputDecoration(
              labelText: LocaleKeys.kIndustry.tr(),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            LocaleKeys.kLocation.tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 15),
          FormBuilderTextField(
            enabled: false,
            name: 'country',
            initialValue: user?.country,
            decoration: InputDecoration(
              labelText:
                  "${LocaleKeys.kCountry.tr()}/${LocaleKeys.kRegion.tr()}",
            ),
          ),
          FormBuilderTextField(
            enabled: false,
            name: 'city',
            initialValue: user?.city,
            decoration: InputDecoration(
              labelText: LocaleKeys.kCity.tr(),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            LocaleKeys.kContactInfo.tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 15),
          FormBuilderTextField(
            enabled: false,
            name: 'email',
            initialValue: user?.email,
            decoration: InputDecoration(
              labelText: LocaleKeys.kEmail.tr(),
            ),
          ),
          FormBuilderTextField(
            enabled: false,
            name: 'phone',
            initialValue: user?.phone,
            decoration: InputDecoration(
              labelText: LocaleKeys.kPhoneNumber.tr(),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
