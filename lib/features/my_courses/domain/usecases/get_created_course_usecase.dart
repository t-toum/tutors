import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/course.dart';
import 'package:tutors/core/usecases/no_params.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repositories/my_course_repository.dart';

@lazySingleton
class GetCreatedCourse implements UseCase<List<Course>,NoParams>{
  final MyCourseRepository _myCourseRepository;
  GetCreatedCourse(this._myCourseRepository);

  @override
  Future<Either<Failure, List<Course>>> call(NoParams params)async {
    return await _myCourseRepository.getCreatedCourse();
  }
}