import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/users.dart';

abstract class AccountRepository {
  Future<Either<Failure, Users>> getCurrentUser();
  Future<Either<Failure, String?>> uploadImage(
      {required File file, String? ref});
  Future<Either<Failure, void>> updateProfile(
      {required String userID, required Map<String, dynamic> data});
}
