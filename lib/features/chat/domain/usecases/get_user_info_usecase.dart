import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../../../../core/models/users.dart';
import '../repositories/chat_repository.dart';

@lazySingleton
class GetUserInfoUsecase implements UseCase<Users, String> {
  final ChatRepository _repository;
  GetUserInfoUsecase(this._repository);

  @override
  Future<Either<Failure, Users>> call(String params) async {
    return await _repository.getUserInfo(params);
  }
}
