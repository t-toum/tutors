import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';
import 'package:tutors/core/utils/auth_service.dart';

abstract class AppRemoteDatasource {
  Future<void> signInWithGoogle();
  Future<void> createUserWithEmail({
    required String email,
    required String password,
  });
  Future<void> singOut();
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

  @override
  Future<void> createUserWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await authService.createUserWithEmail(email, password);
    } catch (e) {
      throw const ServerException("Something went wrong");
    }
  }

  @override
  Future<void> singOut() async {
    try {
      await authService.signOut();
    } catch (e) {
      throw const ServerException("Something went wrong");
    }
  }
}
