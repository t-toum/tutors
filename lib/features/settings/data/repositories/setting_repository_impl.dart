import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/exceptions.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tutors/features/settings/data/datasources/setting_remote_datasource.dart';
import 'package:tutors/features/settings/domain/repositories/setting_repository.dart';

@LazySingleton(as: SettingRepository)
class SettingRepositoryImpl implements SettingRepository {
  final SettingRemoteDatasource _settingRemoteDatasource;

  SettingRepositoryImpl(this._settingRemoteDatasource);

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
}
