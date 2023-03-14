import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/widgets/custom_button.dart';
import 'package:tutors/core/widgets/custom_icon_with_image_button.dart';
import 'package:tutors/features/app/presentation/cubit/app_cubit.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/app_logo.png'),
                Text(
                  "Welcome to Tutors",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 10),
                const Text("Find the right way to learn"),
                const SizedBox(height: 40),
                CustomButton(
                  textButton: "Sign In",
                  onPressed: () {
                    print("sign in");
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    print('sign up');
                  },
                  textButton: 'Sign Up',
                ),
                const SizedBox(height: 20),
                const Text(
                  "or",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                CustomIconWithImageButton(
                  imageUri: 'assets/images/google_logo.png',
                  text: "Google",
                  onTap: () async {
                    await context.read<AppCubit>().signInWithGoogle();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
