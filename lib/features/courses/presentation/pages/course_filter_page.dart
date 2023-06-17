import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../../../../core/models/category.dart';

class CourseFilterPage extends StatelessWidget {
  final List<Category> categories;
  const CourseFilterPage({
    super.key,
    this.categories = const [],
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.kFilterBy.tr()),
        actions: [
          TextButton(
            onPressed: () {
              AppNavigator.goBackWithData(data: formKey.currentState?.value);
            },
            child: Text(
              LocaleKeys.kDone.tr(),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                  ),
            ),
          )
        ],
      ),
      body: FormBuilder(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              FormBuilderDropdown(
                  onChanged: (value) {
                    formKey.currentState?.save();
                  },
                  name: "category",
                  decoration: InputDecoration(
                    labelText: LocaleKeys.kCategory.tr(),
                  ),
                  items: categories.map((item) {
                    return DropdownMenuItem(
                      value: item.name,
                      child: Text(item.name ?? ""),
                    );
                  }).toList()),
              const SizedBox(height: 15),
              FormBuilderDateTimePicker(
                name: "startDate",
                inputType: InputType.date,
                decoration: InputDecoration(
                  labelText: LocaleKeys.kStartDate.tr(),
                  suffixIcon: const Icon(Icons.date_range),
                ),
                onChanged: (value) {
                  formKey.currentState?.save();
                },
                valueTransformer: (value) =>
                    (value != null) ? Timestamp.fromDate(value) : null,
              ),
              const SizedBox(height: 15),
              FormBuilderDateTimePicker(
                name: "endDate",
                onChanged: (value) {
                  formKey.currentState?.save();
                },
                inputType: InputType.date,
                decoration: InputDecoration(
                  labelText: LocaleKeys.kEndDate.tr(),
                  suffixIcon: const Icon(Icons.date_range),
                ),
                valueTransformer: (value) =>
                    (value != null) ? Timestamp.fromDate(value) : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}