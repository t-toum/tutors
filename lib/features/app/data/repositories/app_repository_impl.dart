import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/features/app/data/datasources/app_remote_datasource.dart';
import 'package:tutors/features/app/domain/repository/app_repository.dart';

@LazySingleton(as: AppRepository)
class AppRepositoryImpl implements AppRepository {
  final AppRemoteDatasource _appRemoteDatasource;

  AppRepositoryImpl(this._appRemoteDatasource);

  @override
  Future<Either<Failure, dynamic>> signInWithEmail(
      {required String email, required String password}) async {
    try {
      final res = await _appRemoteDatasource.signInWithEmail(
          email: email, password: password);
      return Right(res);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dynamic>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> signUpWithEmail(
      {required String email, required String password}) async {
    try {
      return Right(await _appRemoteDatasource.signUpWithEmail(
          email: email, password: password));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  // @override
  // Future<Either<Failure, void>> signInWithGoogle() async {
  //   try {
  //     await appRemoteDatasource.signInWithGoogle();
  //     return const Right(null);
  //   } on ServerException catch (e) {
  //     return Left(ServerFailure(e.msg.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, void>> createUserWithEmail({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     await appRemoteDatasource.createUserWithEmail(
  //         email: email, password: password);
  //     return const Right(null);
  //   } on ServerException catch (e) {
  //     return Left(ServerFailure(e.msg.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, void>> signInWithEmail(
  //     {required String email, required String password}) async {
  //   try {
  //     await appRemoteDatasource.signInWithEmail(
  //         email: email, password: password);
  //     return const Right(null);
  //   } on ServerException catch (e) {
  //     return Left(ServerFailure(e.msg.toString()));
  //   }
  // }

  // @override
  // Future<Either<Failure, void>> signOut() async {
  //   try {
  //     await appRemoteDatasource.singOut();
  //     return const Right(null);
  //   } on ServerException catch (e) {
  //     return Left(ServerFailure(e.msg.toString()));
  //   }
  // }
}
