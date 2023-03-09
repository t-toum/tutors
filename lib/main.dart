import 'package:flutter/material.dart';

import 'app.dart';
import 'core/DI/service_locator.dart';

void main() async {
  await configureDependencies();
  runApp(const MyApp());
}
