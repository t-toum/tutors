import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/course.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repositories/my_course_repository.dart';

@lazySingleton
class GetCourseDetailUsecase implements UseCase<Course, String> {
  final MyCourseRepository _myCourseRepository;
  GetCourseDetailUsecase(this._myCourseRepository);
  @override
  Future<Either<Failure, Course>> call(String params) async {
    return await _myCourseRepository.getCourseDetail(id: params);
  }
}
