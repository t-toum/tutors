// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;
import 'package:logger/logger.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i7;
import 'package:tutors/core/DI/register_modules.dart' as _i31;
import 'package:tutors/core/services/auth_service.dart' as _i8;
import 'package:tutors/core/services/cloud_firestore_service.dart' as _i9;
import 'package:tutors/core/services/shared_preference_service.dart' as _i13;
import 'package:tutors/features/app/data/datasources/app_remote_datasource.dart'
    as _i23;
import 'package:tutors/features/app/data/repositories/app_repository_impl.dart'
    as _i25;
import 'package:tutors/features/app/domain/repository/app_repository.dart'
    as _i24;
import 'package:tutors/features/app/domain/usecases/get_current_user_auth_usecase.dart'
    as _i26;
import 'package:tutors/features/app/presentation/cubit/app_cubit.dart' as _i30;
import 'package:tutors/features/home/data/datasources/home_remote_datasource.dart'
    as _i10;
import 'package:tutors/features/home/data/repositories/home_ropository_impl.dart'
    as _i12;
import 'package:tutors/features/home/domain/repositories/home_repository.dart'
    as _i11;
import 'package:tutors/features/home/domain/usecases/sign_out_usecase.dart'
    as _i18;
import 'package:tutors/features/home/presentation/cubit/home_cubit.dart'
    as _i27;
import 'package:tutors/features/sign_in/data/datasources/sign_in_remote_datasorece.dart'
    as _i14;
import 'package:tutors/features/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i16;
import 'package:tutors/features/sign_in/domain/repositories/sign_in_repository.dart'
    as _i15;
import 'package:tutors/features/sign_in/domain/usecases/sign_in_usecase.dart'
    as _i17;
import 'package:tutors/features/sign_in/presentation/cubit/sign_in_cubit.dart'
    as _i28;
import 'package:tutors/features/sign_up/data/datasources/sign_up_remote_datasorece.dart'
    as _i19;
import 'package:tutors/features/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i21;
import 'package:tutors/features/sign_up/domain/repositories/sign_up_repository.dart'
    as _i20;
import 'package:tutors/features/sign_up/domain/usecases/sign_up_usecase.dart'
    as _i22;
import 'package:tutors/features/sign_up/presentation/cubit/sign_up_cubit.dart'
    as _i29; // ignore_for_file: unnecessary_lambdas

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
    gh.lazySingleton<_i4.FirebaseFirestore>(() => injectionModule.firestore);
    gh.factory<_i5.InternetConnectionChecker>(
        () => injectionModule.internetChecker);
    gh.factory<_i6.Logger>(() => injectionModule.logger);
    await gh.factoryAsync<_i7.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i8.AuthService>(_i8.AuthService(gh<_i3.FirebaseAuth>()));
    gh.singleton<_i9.CouldFireStoreService>(
        _i9.CouldFireStoreService(gh<_i4.FirebaseFirestore>()));
    gh.lazySingleton<_i10.HomeRemoteDatasource>(
        () => _i10.HomeRemoteDatasourceImpl(gh<_i8.AuthService>()));
    gh.lazySingleton<_i11.HomeRepository>(
        () => _i12.HomeRepositoryImpl(gh<_i10.HomeRemoteDatasource>()));
    gh.lazySingleton<_i13.SharedPreferenceService>(
        () => _i13.SharedPreferenceServiceImpl(gh<_i7.SharedPreferences>()));
    gh.lazySingleton<_i14.SignInRemoteDatasource>(
        () => _i14.SignInRemoteDatasourceImpl(gh<_i8.AuthService>()));
    gh.lazySingleton<_i15.SignInRepository>(
        () => _i16.SignInRepositoryImpl(gh<_i14.SignInRemoteDatasource>()));
    gh.lazySingleton<_i17.SignInUsecase>(
        () => _i17.SignInUsecase(gh<_i15.SignInRepository>()));
    gh.lazySingleton<_i18.SignOutUsecase>(
        () => _i18.SignOutUsecase(gh<_i11.HomeRepository>()));
    gh.lazySingleton<_i19.SignUpRemoteDatasource>(
        () => _i19.SignUpRemoteDatasourceImpl(
              gh<_i8.AuthService>(),
              gh<_i9.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i20.SignUpRepository>(
        () => _i21.SignUpRepositoryImpl(gh<_i19.SignUpRemoteDatasource>()));
    gh.lazySingleton<_i22.SignUpUsecase>(
        () => _i22.SignUpUsecase(gh<_i20.SignUpRepository>()));
    gh.lazySingleton<_i23.AppRemoteDatasource>(
        () => _i23.AppRemoteDatasourceImpl(gh<_i8.AuthService>()));
    gh.lazySingleton<_i24.AppRepository>(
        () => _i25.AppRepositoryImpl(gh<_i23.AppRemoteDatasource>()));
    gh.lazySingleton<_i26.GetCurrentUserAuthUsecase>(
        () => _i26.GetCurrentUserAuthUsecase(gh<_i24.AppRepository>()));
    gh.factory<_i27.HomeCubit>(() => _i27.HomeCubit(gh<_i18.SignOutUsecase>()));
    gh.factory<_i28.SignInCubit>(
        () => _i28.SignInCubit(gh<_i17.SignInUsecase>()));
    gh.factory<_i29.SignUpCubit>(
        () => _i29.SignUpCubit(gh<_i22.SignUpUsecase>()));
    gh.factory<_i30.AppCubit>(
        () => _i30.AppCubit(gh<_i26.GetCurrentUserAuthUsecase>()));
    return this;
  }
}

class _$InjectionModule extends _i31.InjectionModule {}
