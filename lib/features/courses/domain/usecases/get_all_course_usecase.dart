import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/no_params.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../../../../core/models/course.dart';
import '../repositories/course_repository.dart';

@lazySingleton
class GetAllCourseUsecase implements UseCase<List<Course>, NoParams> {
  final CourseRepository _courseRepository;
  GetAllCourseUsecase(this._courseRepository);

  @override
  Future<Either<Failure, List<Course>>> call(NoParams params) async {
    return await _courseRepository.getAllCourse();
  }
}
