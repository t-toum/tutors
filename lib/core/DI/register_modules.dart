import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class InjectionModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  Logger get logger => Logger();
  InternetConnectionChecker get internetChecker => InternetConnectionChecker();
  @lazySingleton
  FirebaseAuth get auth => FirebaseAuth.instance;
}
