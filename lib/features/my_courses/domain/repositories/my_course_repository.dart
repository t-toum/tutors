import 'package:dartz/dartz.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/course.dart';
import 'package:tutors/core/models/registation.dart';

abstract class MyCourseRepository{
  Future<Either<Failure,List<Registation>>>getRgisteredCourse({String? arg});
  Future<Either<Failure,List<Course>>>getCreatedCourse();
}