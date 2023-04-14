

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tutors/core/error/failures.dart';

abstract class AppRepository {
  Future<Either<Failure,User?>>getCurrentUserFirebase();
}
