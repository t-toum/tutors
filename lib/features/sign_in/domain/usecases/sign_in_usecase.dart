import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/usecase.dart';
import 'package:tutors/features/sign_in/domain/repositories/sign_in_repository.dart';

@lazySingleton
class SignInUsecase implements UseCase<UserCredential, SignInParams> {
  final SignInRepository _signInRepository;
  SignInUsecase(this._signInRepository);

  @override
  Future<Either<Failure, UserCredential>> call(SignInParams params) async {
    return await _signInRepository.signIn(
        email: params.email, password: params.password);
  }
}

class SignInParams {
  final String email;
  final String password;

  SignInParams({required this.email, required this.password});
}
