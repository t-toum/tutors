import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../../../../core/models/registation.dart';
import '../repositories/my_course_repository.dart';

@lazySingleton
class GetRegisterbyCourseUsecase implements UseCase<List<Registation>, String> {
  final MyCourseRepository _myCourseRepository;
  GetRegisterbyCourseUsecase(this._myCourseRepository);

  @override
  Future<Either<Failure, List<Registation>>> call(String params) async {
    return await _myCourseRepository.getRegisterByCourse(courseID: params);
  }
}
