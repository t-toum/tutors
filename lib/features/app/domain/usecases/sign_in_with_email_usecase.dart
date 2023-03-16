import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/usecase_sync.dart';
import 'package:tutors/features/app/domain/repository/app_repository.dart';
import 'package:tutors/features/app/domain/usecases/create_user_with_email.dart';

@lazySingleton
class SignInWithEmailUseCase
    implements SynchronousUseCase<void, EmailAndPassParams> {
  final AppRepository appRepository;

  SignInWithEmailUseCase(this.appRepository);

  @override
  Future<Either<Failure, void>> call(EmailAndPassParams params) async {
    return await appRepository.signInWithEmail(
      email: params.email,
      password: params.password,
    );
  }
}
