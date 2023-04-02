import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/features/sign_in/data/datasources/sign_in_remote_datasorece.dart';
import 'package:tutors/features/sign_in/domain/repositories/sign_in_repository.dart';

@LazySingleton(as: SignInRepository)
class SignInRepositoryImpl implements SignInRepository {
  final SignInRemoteDatasource _signInRemoteDatasource;

  SignInRepositoryImpl(this._signInRemoteDatasource);

  @override
  Future<Either<Failure, UserCredential>> signIn(
      {required String email, required String password}) async {
    try {
      final credential = await _signInRemoteDatasource.signIn(
          email: email, password: password);
      return Right(credential);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
