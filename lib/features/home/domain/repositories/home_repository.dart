import 'package:dartz/dartz.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/users.dart';

abstract class HomeRepository{
  Future<Either<Failure,void>>signOut();
  Future<Either<Failure,Users>>getCurrentUser();
}