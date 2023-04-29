import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tutors/core/models/experience.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repositories/account_repository.dart';

@lazySingleton
class UpdateExperienceUsecase implements UseCase<void, UpdateExperienceParams> {
  final AccountRepository _repository;

  UpdateExperienceUsecase(this._repository);

  @override
  Future<Either<Failure, void>> call(UpdateExperienceParams params) async {
    return await _repository.updateExperience(
        userId: params.userId,
        experienceId: params.experienceId,
        data: params.data);
  }
}

class UpdateExperienceParams {
  final String userId;
  final String experienceId;
  final Experience data;

  UpdateExperienceParams(
      {required this.userId, required this.experienceId, required this.data});
}
