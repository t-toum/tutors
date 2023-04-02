import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';
import 'package:tutors/core/error/failures.dart';

import '../../domain/repositories/sign_up_repository.dart';
import '../datasources/sign_up_remote_datasorece.dart';

@LazySingleton(as: SignUpRepository)
class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpRemoteDatasource _signUpRemoteDatasource;
  SignUpRepositoryImpl(this._signUpRemoteDatasource);

  @override
  Future<Either<Failure, dynamic>> signUp(
      {required String email, required String password}) async {
    try {
      final UserCredential credential = await _signUpRemoteDatasource
          .signUpWithEmail(email: email, password: password);
      return Right(credential);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
