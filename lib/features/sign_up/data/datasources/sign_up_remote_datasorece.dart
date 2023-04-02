import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/services/auth_service.dart';
import 'package:tutors/core/services/cloud_firestore_service.dart';

import '../../../../core/constants/firebase_collection.dart';
import '../../../../core/models/user_model.dart';

abstract class SignUpRemoteDatasource {
  Future<UserCredential> signUpWithEmail(
      {required String email, required String password});
  Future<void> saveUserData({required UserModel data, required String doc});
}

@LazySingleton(as: SignUpRemoteDatasource)
class SignUpRemoteDatasourceImpl implements SignUpRemoteDatasource {
  final AuthService _authService;
  final CouldFireStoreService _fireStoreService;
  SignUpRemoteDatasourceImpl(this._authService, this._fireStoreService);

  @override
  Future<UserCredential> signUpWithEmail(
      {required String email, required String password}) async {
    return await _authService.signUpWithEmail(email: email, password: password);
  }

  @override
  Future<void> saveUserData(
      {required UserModel data, required String doc}) async {
    return await _fireStoreService.saveToFireStore(
      collection: FireCollection.users,
      doc: doc,
      data: data.toJson(),
    );
  }
}
