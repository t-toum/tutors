import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/DI/service_locator.dart';
import 'package:tutors/core/routes/route_path.dart';
import 'package:tutors/features/account/presentation/cubit/account_cubit.dart';
import 'package:tutors/features/account/presentation/pages/account_page.dart';
import 'package:tutors/features/account/presentation/pages/educations/education_page.dart';
import 'package:tutors/features/account/presentation/pages/experiences/edit_experience_page.dart';
import 'package:tutors/features/account/presentation/pages/skills/skills_page.dart';
import 'package:tutors/features/home/presentation/cubit/home_cubit.dart';
import 'package:tutors/features/home/presentation/pages/tabs_page.dart';
import 'package:tutors/features/sign_in/presentation/pages/sign_in_page.dart';
import 'package:tutors/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:tutors/features/sign_up/presentation/pages/select_role_page.dart';
import 'package:tutors/features/sign_up/presentation/pages/sign_up_page.dart';

import '../../features/app/presentation/cubit/app_cubit.dart';
import '../../features/app/presentation/pages/app_page.dart';
import '../../features/sign_in/presentation/cubit/sign_in_cubit.dart';
import '../widgets/not_found_page.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.initRoute:
        return _materialRoute(
          providers: [
            BlocProvider<AppCubit>(
              create: (context) => getIt<AppCubit>()..getAuthentication(),
            ),
          ],
          child: const AppPage(),
        );
      case RoutePath.signUpRoute:
        return _materialRoute(providers: [
          BlocProvider<SignUpCubit>(
            create: (context) => getIt<SignUpCubit>(),
          )
        ], child: const SignUpPage());
      case RoutePath.roleRoute:
        final params = settings.arguments as String;
        return _materialRoute(
          providers: [
            BlocProvider<SignUpCubit>(
              create: (context) => getIt<SignUpCubit>(),
            ),
          ],
          child: SelectRolePage(id: params),
        );
      case RoutePath.signInRoute:
        return _materialRoute(
          providers: [
            BlocProvider<SignInCubit>(
              create: (context) => getIt<SignInCubit>(),
            ),
          ],
          child: const SignInPage(),
        );
      case RoutePath.homeRoute:
        return _materialRoute(
          providers: [
            BlocProvider<HomeCubit>(
              create: (context) => getIt<HomeCubit>()..getCurrentUser(),
            ),
          ],
          child: const TabsPage(),
        );
      case RoutePath.accountRoute:
        return _materialRoute(
          providers: [
            BlocProvider<AccountCubit>(
              create: (context) => getIt<AccountCubit>()..getCurrentUser(),
            ),
          ],
          child: const AccountPage(),
        );
      case RoutePath.educationRoute:
        return _materialRoute(
          providers: [
            BlocProvider<AccountCubit>(
              create: (context) => getIt<AccountCubit>()..getCurrentUser(),
            ),
          ],
          child: const EducationPage(),
        );

      case RoutePath.editExperienceRoute:
        return _materialRoute(
          providers: [
            BlocProvider<AccountCubit>(
              create: (context) => getIt<AccountCubit>()..getCurrentUser(),
            ),
          ],
          child: const EditExperiencePage(),
        );
      case RoutePath.skillsRoute:
        return _materialRoute(
          providers: [
            BlocProvider<AccountCubit>(
              create: (context) => getIt<AccountCubit>()..getCurrentUser(),
            ),
          ],
          child: const SkillsPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const PageNotFound(),
        );
    }
  }

  static Route<dynamic> _materialRoute(
      {required Widget child, List<BlocProvider> providers = const []}) {
    return MaterialPageRoute(
        builder: (context) => providers.isNotEmpty
            ? MultiBlocProvider(providers: providers, child: child)
            : child);
  }
}
