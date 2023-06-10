import 'package:dartz/dartz.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/category.dart';
import 'package:tutors/core/models/course.dart';

abstract class CourseRepository{
  Future<Either<Failure,void>>addCourse({required Course data});
  Future<Either<Failure,List<Course>>>getAllCourse();
  Future<Either<Failure,List<Category>>>getCategories();

}