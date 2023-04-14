import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  Future<Either<Failure, User?>> getCurrentUserFirebase() async {
    try {
      final user = await _appRemoteDatasource.getCurrentuser();
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
