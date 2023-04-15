import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/firebase_collection.dart';
import 'package:tutors/core/error/exceptions.dart';
import 'package:tutors/core/models/users.dart';
import 'package:tutors/core/services/auth_service.dart';

import '../../../../core/services/cloud_firestore_service.dart';

abstract class HomeRemoteDatasource {
  Future<void> signOut();
  Future<Users> getCurrentUser();
}

@LazySingleton(as: HomeRemoteDatasource)
class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final AuthService _authService;
  final CouldFireStoreService _couldFireStoreService;

  HomeRemoteDatasourceImpl(this._authService, this._couldFireStoreService);
  @override
  Future<void> signOut() async {
    return await _authService.signOut();
  }

  @override
  Future<Users> getCurrentUser() async {
    final authUser = await _authService.getCurrentUser();
    final user = await _couldFireStoreService.getDataByDocs(
        collection: FireCollection.users, doc: authUser?.uid ?? '');
    return Users.fromJson(user ?? {});
  }
}
