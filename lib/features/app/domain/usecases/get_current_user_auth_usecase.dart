import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/no_params.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repository/app_repository.dart';

@lazySingleton
class GetCurrentUserAuthUsecase implements UseCase<User?, NoParams> {
  final AppRepository _appRepository;

  GetCurrentUserAuthUsecase(this._appRepository);

  @override
  Future<Either<Failure,
   User?>> call(NoParams params) async {
    return await _appRepository.getCurrentUserFirebase();
  }
}
