import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/usecase.dart';
import 'package:tutors/features/favorites/domain/repositories/favorite_repository.dart';

import '../../../../core/models/favorite.dart';

@lazySingleton
class GetFavoriteUsecase implements UseCase<List<Favorite>, String> {
  final FavoriteRepository _repository;
  GetFavoriteUsecase(this._repository);
  @override
  Future<Either<Failure, List<Favorite>>> call(String params) async {
    return _repository.getFavorite(userId: params);
  }
}
