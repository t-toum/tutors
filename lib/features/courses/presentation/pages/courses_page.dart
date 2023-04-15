import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/features/courses/presentation/cubit/course_cubit.dart';
import 'package:tutors/features/courses/presentation/widgets/search_text_field.dart';

import '../../../../core/constants/app_images.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CourseCubit>();
    return BlocBuilder<CourseCubit, CourseState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.secondaryColor,
          appBar: AppBar(
            backgroundColor: AppColors.secondaryColor,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SearchTextField(
                controller: cubit.searchTextController,
                onReset: state.canReset
                    ? () {
                        cubit.onResetSearchTextfield();
                      }
                    : null,
              ),
            ),
            titleSpacing: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    AppImages.filter,
                    width: 20,
                  ),
                ),
              )
            ],
          ),
          body: GestureDetector(
            onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding:const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text("Body")
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
