import 'package:dartz/dartz.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/favorite.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, void>> addToFavorite({required Favorite data});
  Future<Either<Failure, List<Favorite>>> getFavorite({required String userId});
  Future<Either<Failure, void>> removeFavorite({required String id});

}
