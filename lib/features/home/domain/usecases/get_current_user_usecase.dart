import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/users.dart';
import 'package:tutors/core/usecases/no_params.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repositories/home_repository.dart';

@lazySingleton
class GetCurrentUserDataUsecase implements UseCase<Users, NoParams> {
  final HomeRepository _homeRepository;

  GetCurrentUserDataUsecase(this._homeRepository);

  @override
  Future<Either<Failure, Users>> call(NoParams params) async {
    return await _homeRepository.getCurrentUser();
  }
}
