import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'core/DI/service_locator.dart';

void main() async {
  await configureDependencies();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('la'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}
