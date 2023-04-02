import 'package:injectable/injectable.dart';
import 'package:tutors/core/services/auth_service.dart';

abstract class AppRemoteDatasource {
  // //SignIn with google account
  // Future<dynamic> signInWithGoogle();

  // //Sing up wiht email
  // Future<dynamic> signUpWithEmail({
  //   required String email,
  //   required String password,
  // });

  // //Sign in with email
  // Future<dynamic> signInWithEmail({
  //   required String email,
  //   required String password,
  // });

  // //Firebase auth sign out
  // Future<dynamic> singOut();
}

@LazySingleton(as: AppRemoteDatasource)
class AppRemoteDatasourceImpl implements AppRemoteDatasource {
  final AuthService _authService;
  AppRemoteDatasourceImpl(this._authService);

  // @override
  // Future<void> signInWithEmail(
  //     {required String email, required String password}) async {
  //   return await _authService.signIn(email: email, password: password);
  // }

  // @override
  // Future<dynamic> signInWithGoogle()async {
  //   // TODO: implement signInWithGoogle
  //   throw UnimplementedError();
  // }

  // @override
  // Future<dynamic> signUpWithEmail(
  //     {required String email, required String password}) {
  //   return _authService.signUpWithEmail(email: email, password: password);
  // }

  // @override
  // Future<void> singOut()async {
  //   return await _authService.signOut();
  // }

  // @override
  // Future<void> signInWithGoogle() async {
  //   try {
  //     // await authService.signInWithGoogle();
  //   } catch (e) {
  //     throw const ServerException("Something went wrong");
  //   }
  // }

  // @override
  // Future<void> signInWithEmail(
  //     {required String email, required String password}) {
  //   // TODO: implement signInWithEmail
  //   throw UnimplementedError();
  // }

  // @override
  // Future<void> signUpWithEmail(
  //     {required String email, required String password}) {
  //   // TODO: implement signUpWithEmail
  //   throw UnimplementedError();
  // }

  // @override
  // Future<void> singOut() async {
  //   try {
  //     await _authService.signOut();
  //   } catch (e) {
  //     throw const ServerException("Something went wrong");
  //   }
  // }
}
