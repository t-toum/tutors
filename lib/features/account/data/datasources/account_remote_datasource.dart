import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:tutors/core/models/users.dart';
import 'package:tutors/core/services/auth_service.dart';

import '../../../../core/constants/firebase_collection.dart';
import '../../../../core/services/cloud_firestore_service.dart';
import '../../../../core/services/storage_service.dart';

abstract class AccountRemoteDatasource {
  Future<Users> getCurrentUser();
  Future<String?> uploadImage({required File file, String? ref});
  Future<void> updateProfile(
      {required String userId, required Map<String, dynamic> data});
}

@LazySingleton(as: AccountRemoteDatasource)
class AccountRemoteDatasourceImpl implements AccountRemoteDatasource {
  final AuthService _authService;
  final CouldFireStoreService _couldFireStoreService;
  final StorageService _storageService;

  AccountRemoteDatasourceImpl(
      this._authService, this._couldFireStoreService, this._storageService);
  @override
  Future<Users> getCurrentUser() async {
    final authUser = await _authService.getCurrentUser();
    final user = await _couldFireStoreService.getDataByDocs(
        collection: FireCollection.users, doc: authUser?.uid ?? '');
    return Users.fromJson(user ?? {});
  }

  @override
  Future<String?> uploadImage({required File file, String? ref}) async {
    return await _storageService.uploadImage(file: file, ref: ref);
  }

  @override
  Future<void> updateProfile(
      {required String userId, required Map<String, dynamic> data}) async {
    return await _couldFireStoreService.updateData(
        collection: FireCollection.users, doc: userId, data: data);
  }
}
