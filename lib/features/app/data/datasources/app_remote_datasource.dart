import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';
import 'package:tutors/core/utils/auth_service.dart';

abstract class AppRemoteDatasource {
  Future<void> signInWithGoogle();
}

@LazySingleton(as: AppRemoteDatasource)
class AppRemoteDatasourceImpl extends AppRemoteDatasource {
  final AuthService authService;

  AppRemoteDatasourceImpl(this.authService);

  @override
  Future<void> signInWithGoogle() async {
    try {
      await authService.signInWithGoogle();
    } catch (e) {
      throw const ServerException("Something went wrong");
    }
  }
}
