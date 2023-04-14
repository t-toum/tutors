import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/features/home/data/datasources/home_remote_datasource.dart';

import '../../domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource _remoteDatasource;

  HomeRepositoryImpl(this._remoteDatasource);
  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      return Right(await _remoteDatasource.signOut());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
