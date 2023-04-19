import 'package:injectable/injectable.dart';
import 'package:tutors/core/services/auth_service.dart';

abstract class SettingRemoteDatasource {
  Future<void> signOut();
}

@LazySingleton(as: SettingRemoteDatasource)
class SettingRemoteDatasourceImpl implements SettingRemoteDatasource {
  final AuthService _authService;

  SettingRemoteDatasourceImpl(this._authService);

  @override
  Future<void> signOut() async {
    return await _authService.signOut();
  }
}
