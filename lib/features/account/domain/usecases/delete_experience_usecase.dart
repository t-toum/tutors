import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repositories/account_repository.dart';

@lazySingleton
class DeleteExperienceUsecase implements UseCase<void, DeleteExperienceParams> {
  final AccountRepository _repository;

  DeleteExperienceUsecase(this._repository);

  @override
  Future<Either<Failure, void>> call(DeleteExperienceParams params) async {
    return await _repository.deleteExperience(
        userId: params.userId, experienceId: params.experienceId);
  }
}

class DeleteExperienceParams {
  final String userId;
  final String experienceId;

  DeleteExperienceParams({required this.userId, required this.experienceId});
}
