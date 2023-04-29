import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/education.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repositories/account_repository.dart';

@lazySingleton
class AddEducationUsecase implements UseCase<String?, AddEducationParams> {
  final AccountRepository _repository;

  AddEducationUsecase(this._repository);

  @override
  Future<Either<Failure, String?>> call(AddEducationParams params) async {
    return await _repository.addEducation(
        userId: params.userId, data: params.data);
  }
}

class AddEducationParams {
  final String userId;
  final Education data;

  AddEducationParams({required this.userId, required this.data});
}
