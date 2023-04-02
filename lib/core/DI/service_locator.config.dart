// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i6;
import 'package:logger/logger.dart' as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i8;
import 'package:tutors/core/DI/register_modules.dart' as _i24;
import 'package:tutors/core/services/auth_service.dart' as _i9;
import 'package:tutors/core/services/cloud_firestore_service.dart' as _i10;
import 'package:tutors/features/app/data/datasources/app_remote_datasource.dart'
    as _i19;
import 'package:tutors/features/app/data/repositories/app_repository_impl.dart'
    as _i21;
import 'package:tutors/features/app/domain/repository/app_repository.dart'
    as _i20;
import 'package:tutors/features/app/presentation/cubit/app_cubit.dart' as _i3;
import 'package:tutors/features/sign_in/data/datasources/sign_in_remote_datasorece.dart'
    as _i11;
import 'package:tutors/features/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i13;
import 'package:tutors/features/sign_in/domain/repositories/sign_in_repository.dart'
    as _i12;
import 'package:tutors/features/sign_in/domain/usecases/sign_in_usecase.dart'
    as _i14;
import 'package:tutors/features/sign_in/presentation/cubit/sign_in_cubit.dart'
    as _i22;
import 'package:tutors/features/sign_up/data/datasources/sign_up_remote_datasorece.dart'
    as _i15;
import 'package:tutors/features/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i17;
import 'package:tutors/features/sign_up/domain/repositories/sign_up_repository.dart'
    as _i16;
import 'package:tutors/features/sign_up/domain/usecases/sign_up_usecase.dart'
    as _i18;
import 'package:tutors/features/sign_up/presentation/cubit/sign_up_cubit.dart'
    as _i23; // ignore_for_file: unnecessary_lambdas

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
    gh.factory<_i3.AppCubit>(() => _i3.AppCubit());
    gh.lazySingleton<_i4.FirebaseAuth>(() => injectionModule.auth);
    gh.lazySingleton<_i5.FirebaseFirestore>(() => injectionModule.firestore);
    gh.factory<_i6.InternetConnectionChecker>(
        () => injectionModule.internetChecker);
    gh.factory<_i7.Logger>(() => injectionModule.logger);
    await gh.factoryAsync<_i8.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i9.AuthService>(_i9.AuthService(gh<_i4.FirebaseAuth>()));
    gh.singleton<_i10.CouldFireStoreService>(
        _i10.CouldFireStoreService(gh<_i5.FirebaseFirestore>()));
    gh.lazySingleton<_i11.SignInRemoteDatasource>(
        () => _i11.SignInRemoteDatasourceImpl(gh<_i9.AuthService>()));
    gh.lazySingleton<_i12.SignInRepository>(
        () => _i13.SignInRepositoryImpl(gh<_i11.SignInRemoteDatasource>()));
    gh.lazySingleton<_i14.SignInUsecase>(
        () => _i14.SignInUsecase(gh<_i12.SignInRepository>()));
    gh.lazySingleton<_i15.SignUpRemoteDatasource>(
        () => _i15.SignUpRemoteDatasourceImpl(
              gh<_i9.AuthService>(),
              gh<_i10.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i16.SignUpRepository>(
        () => _i17.SignUpRepositoryImpl(gh<_i15.SignUpRemoteDatasource>()));
    gh.lazySingleton<_i18.SignUpUsecase>(
        () => _i18.SignUpUsecase(gh<_i16.SignUpRepository>()));
    gh.lazySingleton<_i19.AppRemoteDatasource>(
        () => _i19.AppRemoteDatasourceImpl(gh<_i9.AuthService>()));
    gh.lazySingleton<_i20.AppRepository>(
        () => _i21.AppRepositoryImpl(gh<_i19.AppRemoteDatasource>()));
    gh.factory<_i22.SignInCubit>(
        () => _i22.SignInCubit(gh<_i14.SignInUsecase>()));
    gh.factory<_i23.SignUpCubit>(
        () => _i23.SignUpCubit(gh<_i18.SignUpUsecase>()));
    return this;
  }
}

class _$InjectionModule extends _i24.InjectionModule {}
