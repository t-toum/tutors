import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';
import 'package:tutors/core/models/users.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/features/account/domain/repositories/account_repository.dart';

import '../datasources/account_remote_datasource.dart';

@LazySingleton(as: AccountRepository)
class AccountRepositoryImpl implements AccountRepository {
  final AccountRemoteDatasource _accountRemoteDatasource;

  AccountRepositoryImpl(this._accountRemoteDatasource);
  @override
  Future<Either<Failure, Users>> getCurrentUser() async {
    try {
      return Right(await _accountRemoteDatasource.getCurrentUser());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String?>> uploadImage(
      {required File file, String? ref}) async {
    try {
      return Right(
          await _accountRemoteDatasource.uploadImage(file: file, ref: ref));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateProfile(
      {required String userID, required Map<String, dynamic> data}) async {
    try {
      return Right(await _accountRemoteDatasource.updateProfile(
          userId: userID, data: data));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }
}
