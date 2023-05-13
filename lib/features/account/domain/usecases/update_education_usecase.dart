import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repositories/account_repository.dart';

@lazySingleton
class UpdateEducationUsecase implements UseCase<void, UpdateEducationParams> {
  final AccountRepository _repository;

  UpdateEducationUsecase(this._repository);

  @override
  Future<Either<Failure, void>> call(UpdateEducationParams params) async {
    return await _repository.updateEducation(
      userId: params.userId,
      educationId: params.educationId,
      data: params.data,
    );
  }
}

class UpdateEducationParams {
  final String userId;
  final String educationId;
  final Map<String, dynamic> data;

  UpdateEducationParams({
    required this.userId,
    required this.educationId,
    required this.data,
  });
}
