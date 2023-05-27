import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../../../../core/models/course.dart';
import '../repositories/course_repository.dart';

@lazySingleton
class AddCourseUsecase implements UseCase<void, Course> {
  final CourseRepository _courseRepository;

  AddCourseUsecase(this._courseRepository);

  @override
  Future<Either<Failure, void>> call(Course params) async {
    return await _courseRepository.addCourse(data: params);
  }
}
