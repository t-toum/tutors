import 'package:dartz/dartz.dart';
import 'package:tutors/core/error/failures.dart';

abstract class AppRepository {
  Future<Either<Failure, void>> signInWithGoogle();
}
