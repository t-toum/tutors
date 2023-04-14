import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tutors/core/usecases/no_params.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repositories/home_repository.dart';

@lazySingleton
class SignOutUsecase implements UseCase<void, NoParams> {
  final HomeRepository _homeRepository;

  SignOutUsecase(this._homeRepository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await _homeRepository.signOut();
  }
}
