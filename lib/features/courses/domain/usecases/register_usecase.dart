import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/registation.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repositories/course_repository.dart';

@lazySingleton
class RegisterUsecase implements UseCase<void, Registation> {
  final CourseRepository _courseRepository;

  RegisterUsecase(this._courseRepository);
  @override
  Future<Either<Failure, void>> call(Registation params) async {
    return await _courseRepository.register(data: params);
  }
}
