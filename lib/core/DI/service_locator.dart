import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
// import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/DI/service_locator.config.dart';

import '../navigator/app_navigator.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
  // await Firebase.initializeApp();
  AppNavigator();

  await getIt.init();
}
