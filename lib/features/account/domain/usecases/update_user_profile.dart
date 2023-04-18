import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repositories/account_repository.dart';

@lazySingleton
class UpdateUserProfile implements UseCase<void, UpdateProfileParams> {
  final AccountRepository _repository;

  UpdateUserProfile(this._repository);

  @override
  Future<Either<Failure, void>> call(UpdateProfileParams params) async {
    return await _repository.updateProfile(
        userID: params.userID, data: params.data);
  }
}

class UpdateProfileParams {
  final String userID;
  final Map<String, dynamic> data;

  UpdateProfileParams({required this.userID, required this.data});
}
