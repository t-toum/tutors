import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/experience.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repositories/account_repository.dart';

@lazySingleton
class AddExperienceUsecase implements UseCase<String?, AddExperienceParams> {
  final AccountRepository _repository;

  AddExperienceUsecase(this._repository);

  @override
  Future<Either<Failure, String?>> call(AddExperienceParams params) async {
    return await _repository.addExperience(
        experience: params.experience, docID: params.docID);
  }
}

class AddExperienceParams {
  final Experience experience;
  final String docID;

  AddExperienceParams({required this.experience, required this.docID});
}
