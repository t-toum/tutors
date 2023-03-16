import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/core/routes/route_path.dart';
import 'package:tutors/core/widgets/custom_button.dart';
import 'package:tutors/features/app/presentation/cubit/app_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: BlocListener<AppCubit, AppState>(
        listener: (context, state) {
          if (state.isAuth == false)
            AppNavigator.navigateTo(RoutePath.loginRoute);
        },
        child: SafeArea(
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
                    onPressed: () async {
                      await context.read<AppCubit>().signOut();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
