import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/constants/app_images.dart';
import 'package:tutors/features/sign_up/presentation/cubit/sign_up_cubit.dart';

import '../../../../generated/locale_keys.g.dart';
import '../widgets/custom_textfield.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return FormBuilder(
                key: context.read<SignUpCubit>().signUpForm,
                child: Column(
                  children: [
                    Image.asset(AppImages.appLogo),
                    const SizedBox(height: 20),
                    Text(
                      LocaleKeys.kSingUpWithEmail.tr(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 40),
                    CustomTextField(
                      name: "name",
                      icon: AppImages.accountName,
                      hintText: 'Input your name',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required<String>(
                          errorText: "Required",
                        )
                      ]),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      name: "email",
                      icon: AppImages.email,
                      hintText: 'Input your email',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required<String>(
                          errorText: "Required",
                        ),
                        FormBuilderValidators.email(
                            errorText:
                                "Your email invalid ex: yourname@example.com")
                      ]),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      name: "password",
                      obscureText: true,
                      icon: AppImages.lock,
                      hintText: 'Password',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required<String>(
                          errorText: "Required",
                        ),
                        FormBuilderValidators.minLength(6,
                            errorText: 'Password must more then 5 charecter')
                      ]),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () async {
                        await context.read<SignUpCubit>().signUp();
                      },
                      child: Text(
                        LocaleKeys.kSignUp.tr(),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
