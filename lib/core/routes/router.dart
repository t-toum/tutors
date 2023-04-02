import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/DI/service_locator.dart';
import 'package:tutors/core/routes/route_path.dart';

import '../../features/app/presentation/cubit/app_cubit.dart';
import '../../features/app/presentation/pages/app_page.dart';
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
      case RoutePath.loginRoute:
        return _materialRoute(
          providers: [
            BlocProvider<AppCubit>(
              create: (context) => getIt<AppCubit>(),
            ),
          ],
          child: Container(),
        );
      // case RoutePath.signInAndSignUpRoute:
      //   bool isSignIn = settings.arguments as bool;
      //   return _materialRoute(
      //       providers: [
      //         BlocProvider<AppCubit>(
      //           create: (context) => getIt<AppCubit>(),
      //         ),
      //       ],
      //       // child: SignInAndSignUpPage(isSignIn: isSignIn),
      //       child: Container());
      // case RoutePath.homeRoute:
      //   return _materialRoute(
      //     providers: [
      //       BlocProvider<AppCubit>(
      //         create: (context) => getIt<AppCubit>(),
      //       ),
      //     ],
      //     child: Container(),
      //   );
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
