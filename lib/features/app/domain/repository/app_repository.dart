import 'package:dartz/dartz.dart';
import 'package:tutors/core/error/failures.dart';

abstract class AppRepository {
  Future<Either<Failure, void>> signInWithGoogle();
  Future<Either<Failure, void>> createUserWithEmail({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> signOut();
}
