import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:tutors/core/models/education.dart';
import 'package:tutors/core/models/experience.dart';
import 'package:tutors/core/models/users.dart';
import 'package:tutors/core/services/auth_service.dart';

import '../../../../core/constants/firebase_collection.dart';
import '../../../../core/services/cloud_firestore_service.dart';
import '../../../../core/services/storage_service.dart';

abstract class AccountRemoteDatasource {
  Future<Users> getCurrentUser();
  Future<String?> uploadImage({
    required File file,
    String? ref,
  });
  Future<void> updateProfile({
    required String userId,
    required Map<String, dynamic> data,
  });
  Future<String?> addExperience({
    required Experience experience,
    required String docID,
  });
  Future<void> deleteExperience({
    required String userId,
    required String experienceId,
  });
  Future<void> updateExperience({
    required String userId,
    required String experienceId,
    required Experience data,
  });

  //Education
  Future<String?> addEducation({
    required String userId,
    required Education data,
  });
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
    final user =
        await _couldFireStoreService.getUser(docID: authUser?.uid ?? '');
    return user;
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

  @override
  Future<String?> addExperience(
      {required Experience experience, required String docID}) async {
    return await _couldFireStoreService.addExperience(
        experience: experience, docID: docID);
  }

  @override
  Future<void> deleteExperience(
      {required String userId, required String experienceId}) async {
    return await _couldFireStoreService.deleteExperience(
        userId: userId, experienceId: experienceId);
  }

  @override
  Future<void> updateExperience(
      {required String userId,
      required String experienceId,
      required Experience data}) async {
    return await _couldFireStoreService.updateExperience(
        userId: userId, experienceId: experienceId, data: data.toJson());
  }

  @override
  Future<String?> addEducation(
      {required String userId, required Education data}) async {
    return await _couldFireStoreService.addEducation(
        userId: userId, data: data.toJson());
  }
}
