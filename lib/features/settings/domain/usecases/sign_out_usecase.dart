import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tutors/core/usecases/no_params.dart';
import 'package:tutors/core/usecases/usecase.dart';
import 'package:tutors/features/settings/domain/repositories/setting_repository.dart';

@lazySingleton
class SignOutUsecase implements UseCase<void, NoParams> {
  final SettingRepository _repository;
  SignOutUsecase(this._repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await _repository.signOut();
  }
}
