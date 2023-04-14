

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/users.dart';

abstract class AppRepository {
  Future<Either<Failure,User?>>getCurrentUserFirebase();
  Future<Either<Failure,Users>>getCurrentUser({required String doc});
}
