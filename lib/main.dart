import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'core/DI/service_locator.dart';

void main() async {
  await configureDependencies();
  runApp(
    EasyLocalization(
      useOnlyLangCode: true,
      path: 'assets/translations',
      supportedLocales: const [
        Locale('en'),
        Locale('lo'),
      ],
      saveLocale: true,
      useFallbackTranslations: true,
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}
