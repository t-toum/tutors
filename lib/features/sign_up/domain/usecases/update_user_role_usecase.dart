import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repositories/sign_up_repository.dart';

@lazySingleton
class UpdateUserRoleUsecase implements UseCase<void, UpdateUserRoleParams> {
  final SignUpRepository _repository;

  UpdateUserRoleUsecase(this._repository);

  @override
  Future<Either<Failure, void>> call(UpdateUserRoleParams params) {
    return _repository.updateUserRole(doc: params.doc, data: params.data);
  }
}

class UpdateUserRoleParams {
  final String doc;
  final Map<String, dynamic> data;

  UpdateUserRoleParams({required this.doc, required this.data});
}
