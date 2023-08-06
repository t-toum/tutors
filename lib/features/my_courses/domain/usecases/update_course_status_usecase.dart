import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repositories/my_course_repository.dart';

@lazySingleton
class UpdateCourseStatusUsecase
    implements UseCase<void, UpdateCourseStatusParms> {
  final MyCourseRepository _myCourseRepository;

  UpdateCourseStatusUsecase(this._myCourseRepository);

  @override
  Future<Either<Failure, void>> call(UpdateCourseStatusParms params) async {
    return await _myCourseRepository.updateCourseStatus(
        courseID: params.couresID, status: params.status);
  }
}

class UpdateCourseStatusParms {
  final String couresID;
  final bool status;

  UpdateCourseStatusParms({
    required this.couresID,
    this.status = false,
  });
}
