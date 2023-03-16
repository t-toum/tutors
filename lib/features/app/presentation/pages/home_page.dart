import 'package:flutter/material.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                  textButton: "Sign Out",
                  onPressed: () {
                    print("Sign Out");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
