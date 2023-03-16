import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/extensions/string_extension.dart';
import 'package:tutors/features/app/presentation/cubit/app_cubit.dart';

class SignInAndSignUpPage extends StatelessWidget {
  final bool isSignIn;

  const SignInAndSignUpPage({Key? key, this.isSignIn = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = context.read<AppCubit>().formKey;
    return Scaffold(
      appBar: AppBar(
        title: Text(isSignIn ? "Sign In Page" : "Sign Up Page"),
      ),
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Image.asset('assets/images/app_logo.png'),
                !isSignIn
                    ? TextFormField(
                        controller: context.read<AppCubit>().nameController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r"[a-zA-Z]+|\s"),
                          )
                        ],
                        decoration: const InputDecoration(hintText: "Name"),
                        validator: (val) {
                          if (val != null && val.trim() == "")
                            return 'Enter valid name';
                          return null;
                        },
                      )
                    : SizedBox.fromSize(),
                const SizedBox(height: 10),
                TextFormField(
                  controller: context.read<AppCubit>().emailController,
                  decoration: const InputDecoration(hintText: "Email"),
                  validator: (val) {
                    if (val != null && !val.isValidEmail) {
                      return 'Enter valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: context.read<AppCubit>().passwordController,
                  decoration: const InputDecoration(hintText: "Password"),
                  validator: (val) {
                    if (val != null) {
                      if (!val.isValidPassword) return 'Enter valid password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      isSignIn
                          ? context.read<AppCubit>().createUserWithEmail()
                          : context.read<AppCubit>().createUserWithEmail();
                    }
                  },
                  child: Text(isSignIn ? 'Login' : 'Sign Up'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
