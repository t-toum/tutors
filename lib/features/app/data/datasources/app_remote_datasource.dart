import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';
import 'package:tutors/core/extensions/firebase_user_extension.dart';
import 'package:tutors/core/services/auth_service.dart';

import '../../../../core/constants/firebase_collection.dart';
import '../../../../core/models/users.dart';
import '../../../../core/services/cloud_firestore_service.dart';

abstract class AppRemoteDatasource {
  Future<User?> getCurrentuserAuth();
  Future<Users> getUsers({required String doc});
  Future<UserCredential> signInWithGoogle();
  Future<void> setUser(
      {required Map<String, dynamic> data, required String doc});
}

@LazySingleton(as: AppRemoteDatasource)
class AppRemoteDatasourceImpl implements AppRemoteDatasource {
  final AuthService _authService;
  final CouldFireStoreService _couldFireStoreService;

  AppRemoteDatasourceImpl(this._authService, this._couldFireStoreService);
  @override
  Future<User?> getCurrentuserAuth() async {
    return await _authService.getCurrentUser();
  }

  @override
  Future<Users> getUsers({required String doc}) async {
    try {
      final document = await _couldFireStoreService.getDataByDocs(
          collection: FireCollection.users, doc: doc);
      Users user = Users.fromJson(document ?? {});
      return user;
    } on ServerException catch (e) {
      throw ServerException(e.msg);
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    //Check user from firestore
    final authUser = await _authService.signInWithGoogle();
    final result = await _couldFireStoreService.getUser(docID: authUser.user?.uid??"");
    if (result.id == null) {
      await _couldFireStoreService.setData(
        collection: FireCollection.users,
        doc: authUser.user?.uid,
        data: authUser.user.toJson(),
      );
    }
    return authUser;
  }

  @override
  Future<void> setUser(
      {required Map<String, dynamic> data, required String doc}) async {
    return await _couldFireStoreService.setData(
        collection: FireCollection.users, doc: doc, data: data);
  }
}
