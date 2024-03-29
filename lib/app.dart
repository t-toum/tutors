import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tutors/core/routes/route_path.dart';
import 'package:tutors/core/utils/theme_app.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import 'core/navigator/app_navigator.dart';
import 'core/routes/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: LocaleKeys.kAppName,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: RoutePath.initRoute,
      theme: buildTheme(),
    );
  }
}
