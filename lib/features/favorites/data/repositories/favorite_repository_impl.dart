import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/favorite.dart';
import 'package:tutors/features/favorites/data/datasources/favorite_remote_datasource.dart';
import 'package:tutors/features/favorites/domain/repositories/favorite_repository.dart';

@LazySingleton(as: FavoriteRepository)
class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteRemoteDatasource _datasource;

  FavoriteRepositoryImpl(this._datasource);
  @override
  Future<Either<Failure, void>> addToFavorite({required Favorite data}) async {
    try {
      return Right(await _datasource.addToFavorite(data: data));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    }
  }

  @override
  Future<Either<Failure, List<Favorite>>> getFavorite(
      {required String userId}) async {
    try {
      final data = await _datasource.getFavorite(userId: userId);
      return Right(data);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    }
  }

  @override
  Future<Either<Failure, void>> removeFavorite({required String id}) async {
    try {
      return Right(await _datasource.removeFavorite(id: id));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    }
  }
}
