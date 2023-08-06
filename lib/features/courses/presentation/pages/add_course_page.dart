import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/core/widgets/loading_widget.dart';
import 'package:tutors/features/courses/presentation/cubit/course_cubit.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../../../../core/widgets/custom_button.dart';
import '../widgets/pick_image_widget.dart';

class AddCoursePage extends StatelessWidget {
  const AddCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CourseCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.kAddCourse.tr()),
      ),
      body: BlocBuilder<CourseCubit, CourseState>(
        // buildWhen: (previous, current) =>
        //     previous.currentUser != current.currentUser &&
        //     previous.categories != current.categories,
        builder: (context, state) {
          if (state.status == DataStatus.loading) {
            return const LoadingWidget();
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: FormBuilder(
              key: cubit.generalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.kGeneral.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  FormBuilderTextField(
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
                  FormBuilderTextField(
                    // initialValue: experience?.company,
                    name: 'subject',
                    decoration: InputDecoration(
                      labelText: "${LocaleKeys.kSubject.tr()} *",
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required<String>(
                        errorText: LocaleKeys.kRequiredField.tr(),
                      ),
                    ]),
                  ),
                  FormBuilderTextField(
                    // initialValue: experience?.company,
                    name: 'location',
                    decoration: InputDecoration(
                      labelText: "${LocaleKeys.kLocation.tr()} *",
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required<String>(
                        errorText: LocaleKeys.kRequiredField.tr(),
                      ),
                    ]),
                  ),
                  FormBuilderDropdown(
                    name: "category",
                    decoration: InputDecoration(
                      labelText: "${LocaleKeys.kCategory.tr()} *",
                    ),
                    items: state.categories?.map((item) {
                          return DropdownMenuItem(
                            value: item.name,
                            child: Text(item.name ?? ""),
                          );
                        }).toList() ??
                        [],
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: LocaleKeys.kRequiredField.tr(),
                      ),
                    ]),
                  ),
                  FormBuilderDateTimePicker(
                    name: "startDate",
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
                  FormBuilderDateTimePicker(
                    name: "endDate",
                    inputType: InputType.date,
                    decoration: InputDecoration(
                      labelText: "${LocaleKeys.kEndDate.tr()} *",
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
                  const SizedBox(height: 20),

                  FormBuilderTextField(
                    // initialValue: experience?.company,
                    name: 'maximum',
                    decoration: InputDecoration(
                      labelText: "${LocaleKeys.kMaximum.tr()} *",
                    ),
                    keyboardType: TextInputType.number,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required<String>(
                        errorText: LocaleKeys.kRequiredField.tr(),
                      ),
                    ]),
                    valueTransformer: (value) =>value!=null? int.parse(value):0,
                  ),
                  const SizedBox(height: 8,),
                  Text(LocaleKeys.kMaximumDesc.tr(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                          )),
                  const SizedBox(height: 20),
                  PickImageWidget(
                    file: state.imageFile,
                    onRemove: () => cubit.removeImage(),
                    onTap: () {
                      AppNavigator.openModalImagePicker(onCamera: () {
                        AppNavigator.goBack();
                        cubit.getImage(source: ImageSource.camera);
                      }, onGallery: () {
                        AppNavigator.goBack();
                        cubit.getImage(source: ImageSource.gallery);
                      });
                    },
                  ),
                  // InkWell(
                  //   onTap: (){
                  //     cubit.getImage(source: ImageSource.camera);
                  //   },
                  //   child: Container(
                  //     height: 200,
                  //     width: double.infinity,
                  //     padding: const EdgeInsets.all(10),
                  //     color: AppColors.greyColor,
                  //     child: state.imageFile != null
                  //         ? Image.file(state.imageFile!)
                  //         :const Icon(Icons.image),
                  //   ),
                  // ),
                  const SizedBox(height: 40),
                  FormBuilderTextField(
                    name: 'description',
                    keyboardType: TextInputType.multiline,
                    maxLines: 8,
                    decoration: InputDecoration(
                      hintText: LocaleKeys.kDescription.tr(),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    onPressed: () async {
                      await cubit.onSaveCourse();
                    },
                    textButton: LocaleKeys.kSave.tr(),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
