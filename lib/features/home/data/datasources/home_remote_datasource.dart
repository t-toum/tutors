import 'package:injectable/injectable.dart';
import 'package:tutors/core/services/auth_service.dart';

abstract class HomeRemoteDatasource {
  Future<void> signOut();
}

@LazySingleton(as: HomeRemoteDatasource)
class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final AuthService _authService;

  HomeRemoteDatasourceImpl(this._authService);
  @override
  Future<void> signOut() async {
    return await _authService.signOut();
  }
}
