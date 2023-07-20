import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/favorite.dart';
import 'package:tutors/core/usecases/usecase.dart';
import 'package:tutors/features/favorites/domain/repositories/favorite_repository.dart';

@lazySingleton
class AddFavoriteUsecase implements UseCase<void, Favorite> {
  final FavoriteRepository _repository;

  AddFavoriteUsecase(this._repository);

  @override
  Future<Either<Failure, void>> call(Favorite params) async {
    return await _repository.addToFavorite(data: params);
  }
}
