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
import '../../domain/params/add_course_params.dart';
import '../widgets/pick_image_widget.dart';

class AddCoursePage extends StatelessWidget {
  final AddCourseParams params;
  const AddCoursePage({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CourseCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(params.title),
      ),
      body: BlocBuilder<CourseCubit, CourseState>(
        builder: (context, state) {
          if (state.status == DataStatus.loading) {
            return const LoadingWidget();
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: FormBuilder(
              initialValue: params.data,
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
                  params.isUpdate?CustomButton(
                    onPressed: ()async{
                      await cubit.onUpdateCourse(courseID: params.data['id']);
                    },
                    textButton: LocaleKeys.kUpdate.tr(),
                  ):CustomButton(
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
