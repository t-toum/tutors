import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/services/auth_service.dart';

abstract class SignInRemoteDatasource {
  Future<UserCredential> signIn({
    required String email,
    required String password,
  });
}

@LazySingleton(as: SignInRemoteDatasource)
class SignInRemoteDatasourceImpl implements SignInRemoteDatasource {
  final AuthService _authService;

  SignInRemoteDatasourceImpl(this._authService);

  @override
  Future<UserCredential> signIn(
      {required String email, required String password}) async {
    return await _authService.signIn(email: email, password: password);
  }
}
