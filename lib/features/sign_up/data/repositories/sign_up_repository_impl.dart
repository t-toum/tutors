import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/users.dart';

import '../../domain/repositories/sign_up_repository.dart';
import '../datasources/sign_up_remote_datasorece.dart';

@LazySingleton(as: SignUpRepository)
class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpRemoteDatasource _signUpRemoteDatasource;
  SignUpRepositoryImpl(this._signUpRemoteDatasource);

  @override
  Future<Either<Failure, UserCredential>> signUp(
      {required String email, required String password, String? firstName,String? lastName}) async {
    try {
      final UserCredential credential = await _signUpRemoteDatasource
          .signUpWithEmail(email: email, password: password);
      Users data = Users(
        id: credential.user?.uid,
        firstName: firstName,
        lastName: lastName,
        email: credential.user?.email
      );
      await _signUpRemoteDatasource.saveUserData(
          data: data, doc: credential.user?.uid ?? '');
      return Right(credential);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserRole(
      {required String doc, required Map<String, dynamic> data}) async {
    try {
      return Right(
          await _signUpRemoteDatasource.updateUserRole(doc: doc, data: data));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
