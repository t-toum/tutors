import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/usecase.dart';
import 'package:tutors/features/courses/domain/params/update_course_params.dart';

import '../repositories/course_repository.dart';

@lazySingleton
class UpdateCourseUsecase implements UseCase<void, UpdateCourseParams> {
  final CourseRepository _courseRepository;
  UpdateCourseUsecase(this._courseRepository);
  @override
  Future<Either<Failure, void>> call(UpdateCourseParams params) async {
    return await _courseRepository.updateCourse(params: params);
  }
}
