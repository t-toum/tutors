import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tutors/core/models/users.dart';
import 'package:tutors/core/usecases/no_params.dart';
import 'package:tutors/core/usecases/usecase.dart';
import 'package:tutors/features/account/domain/repositories/account_repository.dart';

@lazySingleton
class GetCurrentUserUsecase implements UseCase<Users, NoParams> {
  final AccountRepository _repository;
  GetCurrentUserUsecase(this._repository);
  @override
  Future<Either<Failure, Users>> call(NoParams params) async {
    return await _repository.getCurrentUser();
  }
}
