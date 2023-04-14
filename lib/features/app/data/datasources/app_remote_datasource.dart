import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/services/auth_service.dart';

abstract class AppRemoteDatasource {
  Future<User?> getCurrentuser();
}

@LazySingleton(as: AppRemoteDatasource)
class AppRemoteDatasourceImpl implements AppRemoteDatasource {
  final AuthService _authService;

  AppRemoteDatasourceImpl(this._authService);
  @override
  Future<User?> getCurrentuser() async {
    return await _authService.getCurrentUser();
  }
}
