import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/usecase.dart';
import 'package:tutors/features/sign_up/domain/repositories/sign_up_repository.dart';

@lazySingleton
class SignUpUsecase implements UseCase<dynamic, SignUpParams> {
  final SignUpRepository _repository;

  SignUpUsecase(this._repository);

  @override
  Future<Either<Failure, UserCredential>> call(SignUpParams params) async {
    return await _repository.signUp(
        email: params.email, password: params.password, name: params.name);
  }
}

class SignUpParams {
  final String email;
  final String password;
  final String name;

  SignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
