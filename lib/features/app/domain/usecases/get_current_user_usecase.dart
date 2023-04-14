import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tutors/core/models/users.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repository/app_repository.dart';

@lazySingleton
class GetCurrentUserUsecase implements UseCase<Users, String> {
  final AppRepository _appRepository;

  GetCurrentUserUsecase(this._appRepository);

  @override
  Future<Either<Failure, Users>> call(String params) async {
    return await _appRepository.getCurrentUser(doc: params);
  }
}
