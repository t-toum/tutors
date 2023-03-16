import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/usecase_sync.dart';
import 'package:tutors/features/app/domain/repository/app_repository.dart';

@lazySingleton
class CreateUserWithEmailUseCase
    implements SynchronousUseCase<void, EmailAndPassParams> {
  final AppRepository appRepository;

  CreateUserWithEmailUseCase(this.appRepository);

  @override
  Future<Either<Failure, void>> call(EmailAndPassParams params) async {
    return await appRepository.createUserWithEmail(
      email: params.email,
      password: params.password,
    );
  }
}

class EmailAndPassParams {
  final String email;
  final String password;

  EmailAndPassParams({required this.email, required this.password});
}
