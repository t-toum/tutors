import 'package:dartz/dartz.dart';
import 'package:tutors/core/error/failures.dart';

abstract class SettingRepository{
  Future<Either<Failure,void>>signOut();
  String? getLanguage();
  Future<Either<Failure,bool>>setLanguage({String? code});
}