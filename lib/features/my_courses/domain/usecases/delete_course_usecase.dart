import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repositories/my_course_repository.dart';

@lazySingleton
class DeleteCourseUsecase implements UseCase<void, String> {
  final MyCourseRepository _myCourseRepository;

  DeleteCourseUsecase(this._myCourseRepository);

  @override
  Future<Either<Failure, void>> call(String params) async {
    return await _myCourseRepository.deleteCourse(params);
  }
}
