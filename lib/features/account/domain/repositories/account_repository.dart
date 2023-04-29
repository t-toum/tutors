import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/experience.dart';
import 'package:tutors/core/models/users.dart';

abstract class AccountRepository {
  Future<Either<Failure, Users>> getCurrentUser();
  Future<Either<Failure, String?>> uploadImage(
      {required File file, String? ref});
  Future<Either<Failure, void>> updateProfile(
      {required String userID, required Map<String, dynamic> data});

  Future<Either<Failure, String?>> addExperience(
      {required Experience experience, required String docID});
  Future<Either<Failure, void>> deleteExperience(
      {required String userId, required String experienceId});
  Future<Either<Failure,void>>updateExperience({
    required String userId,
    required String experienceId,
    required Experience data,
  });
}
