import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repository/app_repository.dart';

@lazySingleton
class SignInWithEmailUsecase
    implements UseCase<dynamic, SignInWithEmailParams> {
  final AppRepository _appRepository;

  SignInWithEmailUsecase(this._appRepository);
  @override
  Future<Either<Failure, dynamic>> call(SignInWithEmailParams params) async {
    return await _appRepository.signInWithEmail(
        email: params.email, password: params.password);
  }
}

class SignInWithEmailParams extends Equatable {
  final String email;
  final String password;

  const SignInWithEmailParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
