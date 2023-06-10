import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/course.dart';

import '../../domain/repositories/course_repository.dart';
import '../datasources/course_remote_datasource.dart';

@LazySingleton(as: CourseRepository)
class CourseRepositoryImpl implements CourseRepository {
  final CourseRemoteDatasource _courseRemoteDatasource;

  CourseRepositoryImpl(this._courseRemoteDatasource);

  @override
  Future<Either<Failure, void>> addCourse({required Course data}) async {
    try {
      return Right(await _courseRemoteDatasource.addCourse(data: data));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Course>>> getAllCourse() async {
    try {
      final listCourse = await _courseRemoteDatasource.getAllCourse();
      // for (Course e in listCourse) {
      //   // await 

      // }
      return Right(listCourse);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }
}