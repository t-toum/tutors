import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/users.dart';
import 'package:tutors/features/app/data/datasources/app_remote_datasource.dart';
import 'package:tutors/features/app/domain/repository/app_repository.dart';

@LazySingleton(as: AppRepository)
class AppRepositoryImpl implements AppRepository {
  final AppRemoteDatasource _appRemoteDatasource;

  AppRepositoryImpl(this._appRemoteDatasource);
  @override
  Future<Either<Failure, User?>> getCurrentUserFirebase() async {
    try {
      final user = await _appRemoteDatasource.getCurrentuserAuth();
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Users>> getCurrentUser({required String doc}) async {
    try {
      final user = await _appRemoteDatasource.getCurrentUsers(doc: doc);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signInWithGoogle() async {
    try {
      final userCredential = await _appRemoteDatasource.signInWithGoogle();
      return Right(userCredential);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveUserData(
      {required String doc, required Map<String, dynamic> data}) async {
    try {
      return Right(await _appRemoteDatasource.setUser(data: data, doc: doc));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }
}
