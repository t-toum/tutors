import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tutors/core/error/failures.dart';

abstract class SignUpRepository {
  Future<Either<Failure,UserCredential>>signUp({required String email, required String password ,String name});
}