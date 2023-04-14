import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tutors/features/sign_in/presentation/cubit/sign_in_cubit.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/navigator/app_navigator.dart';
import '../../../../core/routes/route_path.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../generated/locale_keys.g.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state.status == DataStatus.failure) {
          Fluttertoast.showToast(msg: state.error ?? '');
        }
      },
      builder: (context, state) {
        if (state.status == DataStatus.loading) {
          return const LoadingWidget();
        }
        return Scaffold(
          backgroundColor: AppColors.secondaryColor,
          appBar: AppBar(
            backgroundColor: AppColors.secondaryColor,
            elevation: 0,
            foregroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: FormBuilder(
              key: context.read<SignInCubit>().signInForm,
              child: Column(
                children: [
                  Image.asset(AppImages.appLogo),
                  const SizedBox(height: 20),
                  Text(
                    LocaleKeys.kSingInWithEmail.tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 40),
                  CustomTextField(
                    name: "email",
                    icon: AppImages.email,
                    hintText:LocaleKeys.kEmail.tr(),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required<String>(
                        errorText: LocaleKeys.kRequiredField.tr(),
                      ),
                      FormBuilderValidators.email(
                          errorText:LocaleKeys.kEmailPattern.tr())
                    ]),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    name: "password",
                    obscureText: true,
                    icon: AppImages.lock,
                    hintText: LocaleKeys.kPassword.tr(),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required<String>(
                        errorText: LocaleKeys.kRequiredField.tr(),
                      ),
                      FormBuilderValidators.minLength(6,
                          errorText: LocaleKeys.kPasswordValidateText.tr())
                    ]),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          LocaleKeys.kForgotPassword.tr(),
                          style:const TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () async {
                      await context.read<SignInCubit>().signIn();
                    },
                    child: Text(
                      LocaleKeys.kSignIn.tr(),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(LocaleKeys.kDontHaveAnAccount.tr(),
                          style: Theme.of(context).textTheme.bodyMedium),
                      TextButton(
                        onPressed: () {
                          AppNavigator.goBack();
                          AppNavigator.navigateTo(RoutePath.signUpRoute);
                        },
                        child: Text(LocaleKeys.kSignUp.tr()),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
