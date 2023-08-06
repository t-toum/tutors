import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/course.dart';
import 'package:tutors/core/models/registation.dart';

import '../../domain/repositories/my_course_repository.dart';
import '../datasources/my_course_remote_datasource.dart';

@LazySingleton(as: MyCourseRepository)
class MyCourseRepositoryImpl implements MyCourseRepository {
  final MyCourseRemoteDatasource _courseRemoteDatasource;

  MyCourseRepositoryImpl(this._courseRemoteDatasource);
  @override
  Future<Either<Failure, List<Registation>>> getRgisteredCourse(
      {String? arg}) async {
    try {
      final result = await _courseRemoteDatasource.getRgisteredCourse(arg: arg);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    }
  }

  @override
  Future<Either<Failure, List<Course>>> getCreatedCourse() async {
    try {
      final result = await _courseRemoteDatasource.getCreatedCourse();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Course>> getCourseDetail({required String id}) async {
    try {
      final result = await _courseRemoteDatasource.getCourseDetail(id: id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Registation>>> getRegisterByCourse(
      {required String courseID}) async {
    try {
      final result =
          await _courseRemoteDatasource.getRegisterByCourse(courseID: courseID);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateCourseStatus(
      {required String courseID, required bool status}) async {
    try {
      final result = await _courseRemoteDatasource.updateCourseStatus(
          courseID: courseID, status: status);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCourse(String courseID) async {
    try {
      final result = await _courseRemoteDatasource.deleteCourse(courseID);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }
}
