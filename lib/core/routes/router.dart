import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/DI/service_locator.dart';
import 'package:tutors/core/routes/route_path.dart';
import 'package:tutors/features/app/presentation/pages/sign_in_page.dart';

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
          child: const SignInPage(),
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
