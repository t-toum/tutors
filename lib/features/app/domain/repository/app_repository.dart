import 'package:dartz/dartz.dart';
import 'package:tutors/core/error/failures.dart';

abstract class AppRepository {
  Future<Either<Failure, dynamic>> signInWithGoogle();
  Future<Either<Failure, dynamic>> signUpWithEmail({
    required String email,
    required String password,
  });
  Future<Either<Failure, dynamic>> signInWithEmail({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> signOut();
}
