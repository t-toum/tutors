import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/constants/app_images.dart';
import 'package:tutors/core/models/course.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/core/widgets/loading_widget.dart';
import 'package:tutors/features/courses/presentation/cubit/course_cubit.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../../../../core/widgets/avatar_widget.dart';
import '../widgets/image_widget.dart';

class RegisterPage extends StatelessWidget {
  final Course param;
  const RegisterPage({super.key, required this.param});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.kRegister.tr(),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.bubbleWhite),
              ),
            ),
          )
        ],
      ),
      body: BlocConsumer<CourseCubit, CourseState>(
        listener: (context, state) {
          if (state.status == DataStatus.success && state.registered) {
            Fluttertoast.showToast(msg: LocaleKeys.kRegisterSuccess.tr());
            AppNavigator.goBack();
            AppNavigator.goBack();
          }
        },
        builder: (context, state) {
          if (state.status == DataStatus.loading) {
            return const LoadingWidget();
          }
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageWidget(
                        url: param.imageUrl,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        param.title ?? '',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 15),
                      AvatarWidget(
                        width: 50,
                        height: 50,
                        imageUrl: param.users?.profileUrl ?? '',
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${param.users?.firstName} ${param.users?.lastName}",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(param.description ?? '-')
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (state.isRegistered)
                    ? null
                    : () async {
                        await context
                            .read<CourseCubit>()
                            .register(couresId: param.id ?? '');
                      },
                child: Container(
                  height: 45,
                  width: double.infinity,
                  color:state.isRegistered? AppColors.greyColor:AppColors.primaryColor,
                  child: Center(
                    child:(state.isRegistered)? Text(
                      LocaleKeys.kRegistered.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white),
                    ):Text(
                      LocaleKeys.kConfirm.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
