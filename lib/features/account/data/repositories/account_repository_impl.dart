import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';
import 'package:tutors/core/models/education.dart';
import 'package:tutors/core/models/experience.dart';
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

  @override
  Future<Either<Failure, String?>> addExperience(
      {required Experience experience, required String docID}) async {
    try {
      final result = await _accountRemoteDatasource.addExperience(
          experience: experience, docID: docID);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteExperience(
      {required String userId, required String experienceId}) async {
    try {
      return Right(await _accountRemoteDatasource.deleteExperience(
          userId: userId, experienceId: experienceId));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateExperience(
      {required String userId,
      required String experienceId,
      required Experience data}) async {
    try {
      return Right(await _accountRemoteDatasource.updateExperience(
          userId: userId, experienceId: experienceId, data: data));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String?>> addEducation(
      {required String userId, required Education data}) async {
    try {
      return Right(await _accountRemoteDatasource.addEducation(
          userId: userId, data: data));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteEducation(
      {required String userId, required String educationId}) async {
    try {
      return Right(await _accountRemoteDatasource.deleteEducation(
        userId: userId,
        educationId: educationId,
      ));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateEducation(
      {required String userId,
      required String educationId,
      required Map<String, dynamic> data}) async {
    try {
      return Right(
        await _accountRemoteDatasource.updateEducation(
          userId: userId,
          educationId: educationId,
          data: data,
        ),
      );
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Users>> getProfile({required String id}) async {
    try {
      return Right(await _accountRemoteDatasource.getProfile(id: id));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }
}
