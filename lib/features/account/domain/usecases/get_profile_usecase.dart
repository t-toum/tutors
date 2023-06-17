import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/users.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repositories/account_repository.dart';

@lazySingleton
class GetProfileUsecase implements UseCase<Users, String> {
  final AccountRepository _repository;
  GetProfileUsecase(this._repository);
  @override
  Future<Either<Failure, Users>> call(String params) async {
    return await _repository.getProfile(id: params);
  }
}
