import 'package:dartz/dartz.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/course.dart';
import 'package:tutors/core/models/registation.dart';

abstract class MyCourseRepository{
  Future<Either<Failure,List<Registation>>>getRgisteredCourse({String? arg});
  Future<Either<Failure,List<Course>>>getCreatedCourse();
  Future<Either<Failure,Course>>getCourseDetail({required String id});
  Future<Either<Failure,List<Registation>>>getRegisterByCourse({required String courseID});
  Future<Either<Failure,void>>updateCourseStatus({required String courseID,required bool status});
  Future<Either<Failure,void>>deleteCourse(String courseID);
}