// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;
import 'package:logger/logger.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i6;
import 'package:tutors/core/DI/register_modules.dart' as _i13;
import 'package:tutors/core/services/auth_service.dart' as _i7;
import 'package:tutors/features/app/data/datasources/app_remote_datasource.dart'
    as _i8;
import 'package:tutors/features/app/data/repositories/app_repository_impl.dart'
    as _i10;
import 'package:tutors/features/app/domain/repository/app_repository.dart'
    as _i9;
import 'package:tutors/features/app/domain/usecases/sign_in_with_email_usecase.dart'
    as _i11;
import 'package:tutors/features/app/presentation/cubit/app_cubit.dart'
    as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    gh.lazySingleton<_i3.FirebaseAuth>(() => injectionModule.auth);
    gh.factory<_i4.InternetConnectionChecker>(
        () => injectionModule.internetChecker);
    gh.factory<_i5.Logger>(() => injectionModule.logger);
    await gh.factoryAsync<_i6.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i7.AuthService>(_i7.AuthService(gh<_i3.FirebaseAuth>()));
    gh.lazySingleton<_i8.AppRemoteDatasource>(
        () => _i8.AppRemoteDatasourceImpl(gh<_i7.AuthService>()));
    gh.lazySingleton<_i9.AppRepository>(
        () => _i10.AppRepositoryImpl(gh<_i8.AppRemoteDatasource>()));
    gh.lazySingleton<_i11.SignInWithEmailUsecase>(
        () => _i11.SignInWithEmailUsecase(gh<_i9.AppRepository>()));
    gh.factory<_i12.AppCubit>(
        () => _i12.AppCubit(gh<_i11.SignInWithEmailUsecase>()));
    return this;
  }
}

class _$InjectionModule extends _i13.InjectionModule {}
