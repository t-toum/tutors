import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repository/app_repository.dart';

@lazySingleton
class SaveUserDataUsecase implements UseCase<void, SaveUserParams> {
  final AppRepository _appRepository;

  SaveUserDataUsecase(this._appRepository);

  @override
  Future<Either<Failure, void>> call(SaveUserParams params) async {
    return await _appRepository.saveUserData(
        doc: params.doc, data: params.data);
  }
}

class SaveUserParams {
  final String doc;
  final Map<String, dynamic> data;

  SaveUserParams({required this.doc, required this.data});
}
