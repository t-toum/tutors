import 'package:dartz/dartz.dart';
import 'package:tutors/core/error/failures.dart';

abstract class SignUpRepository {
  Future<Either<Failure,dynamic>>signUp({required String email, required String password});
}