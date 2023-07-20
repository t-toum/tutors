import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repositories/favorite_repository.dart';

@lazySingleton
class RemoveFavoriteUsecase implements UseCase<void, String> {
  final FavoriteRepository _repository;

  RemoveFavoriteUsecase(this._repository);

  @override
  Future<Either<Failure, void>> call(String params) async {
    return await _repository.removeFavorite(id: params);
  }
}
