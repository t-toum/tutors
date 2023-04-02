import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/services/auth_service.dart';

abstract class SignUpRemoteDatasource {
  Future<UserCredential> signUpWithEmail(
      {required String email, required String password});
}

@LazySingleton(as: SignUpRemoteDatasource)
class SignUpRemoteDatasourceImpl implements SignUpRemoteDatasource {
  final AuthService _authService;
  SignUpRemoteDatasourceImpl(this._authService);

  @override
  Future<UserCredential> signUpWithEmail(
      {required String email, required String password}) async {
    return await _authService.signUpWithEmail(email: email, password: password);
  }
}
