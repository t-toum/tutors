import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repositories/account_repository.dart';

@lazySingleton
class UploadImageUsecase implements UseCase<String?, UploadImageParams> {
  final AccountRepository _repository;
  UploadImageUsecase(this._repository);

  @override
  Future<Either<Failure, String?>> call(UploadImageParams params) async {
    return await _repository.uploadImage(file: params.file, ref: params.ref);
  }
}

class UploadImageParams {
  final File file;
  final String? ref;
  UploadImageParams({
    required this.file,
    this.ref,
  });
}
