import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tutors/features/app/data/datasources/app_remote_datasource.dart';
import 'package:tutors/features/app/domain/repository/app_repository.dart';

@LazySingleton(as: AppRepository)
class AppRepositoryImpl implements AppRepository {
  final AppRemoteDatasource appRemoteDatasource;

  AppRepositoryImpl(this.appRemoteDatasource);

  @override
  Future<Either<Failure, void>> signInWithGoogle() async {
    try {
      await appRemoteDatasource.signInWithGoogle();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg.toString()));
    }
  }
}
