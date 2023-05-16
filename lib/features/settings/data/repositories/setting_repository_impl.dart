import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tutors/features/settings/data/datasources/setting_remote_datasource.dart';
import 'package:tutors/features/settings/domain/repositories/setting_repository.dart';

import '../datasources/setting_local_datasource.dart';

@LazySingleton(as: SettingRepository)
class SettingRepositoryImpl implements SettingRepository {
  final SettingRemoteDatasource _settingRemoteDatasource;
  final SettingLocalDatasource _settingLocalDatasource;

  SettingRepositoryImpl(
      this._settingRemoteDatasource, this._settingLocalDatasource);

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      return Right(await _settingRemoteDatasource.signOut());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.msg));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }

  @override
  String? getLanguage() {
    try {
      return _settingLocalDatasource.getLanguage();
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Future<Either<Failure, bool>> setLanguage({String? code}) async {
    try {
      return Right(await _settingLocalDatasource.setLanguage(code: code));
    } on CacheException catch (e) {
      return Left(CachedFailure(e.msg));
    } catch (e) {
      return Left(CachedFailure(e.toString()));
    }
  }
}
