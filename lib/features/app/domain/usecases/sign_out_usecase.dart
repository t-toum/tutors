import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/no_params.dart';
import 'package:tutors/core/usecases/usecase_sync.dart';
import 'package:tutors/features/app/domain/repository/app_repository.dart';

@lazySingleton
class SignOutUseCase implements SynchronousUseCase<void, NoParams> {
  final AppRepository appRepository;

  SignOutUseCase(this.appRepository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await appRepository.signOut();
  }
}
