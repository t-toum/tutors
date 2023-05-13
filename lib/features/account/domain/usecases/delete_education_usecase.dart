import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repositories/account_repository.dart';

@lazySingleton
class DeleteEducatonUsecase implements UseCase<void, DeleteEducationParams> {
  final AccountRepository _repository;

  DeleteEducatonUsecase(this._repository);

  @override
  Future<Either<Failure, void>> call(DeleteEducationParams params) async {
    return await _repository.deleteEducation(
      userId: params.userId,
      educationId: params.educationId,
    );
  }
}

class DeleteEducationParams {
  final String userId;
  final String educationId;

  DeleteEducationParams({
    required this.userId,
    required this.educationId,
  });
}
