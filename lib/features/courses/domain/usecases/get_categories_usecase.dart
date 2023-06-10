import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/no_params.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../../../../core/models/category.dart';
import '../repositories/course_repository.dart';

@lazySingleton
class GetCategoriesUsecase implements UseCase<List<Category>, NoParams> {
  final CourseRepository _courseRepository;
  GetCategoriesUsecase(this._courseRepository);

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    return await _courseRepository.getCategories();
  }
}
