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
import 'package:tutors/core/DI/register_modules.dart' as _i20;
import 'package:tutors/core/services/auth_service.dart' as _i8;
import 'package:tutors/core/services/cloud_firestore_service.dart' as _i9;
import 'package:tutors/features/app/data/datasources/app_remote_datasource.dart'
    as _i14;
import 'package:tutors/features/app/data/repositories/app_repository_impl.dart'
    as _i16;
import 'package:tutors/features/app/domain/repository/app_repository.dart'
    as _i15;
import 'package:tutors/features/app/domain/usecases/sign_in_with_email_usecase.dart'
    as _i17;
import 'package:tutors/features/app/presentation/cubit/app_cubit.dart' as _i19;
import 'package:tutors/features/sign_up/data/datasources/sign_up_remote_datasorece.dart'
    as _i10;
import 'package:tutors/features/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i12;
import 'package:tutors/features/sign_up/domain/repositories/sign_up_repository.dart'
    as _i11;
import 'package:tutors/features/sign_up/domain/usecases/sign_up_usecase.dart'
    as _i13;
import 'package:tutors/features/sign_up/presentation/cubit/sign_up_cubit.dart'
    as _i18; // ignore_for_file: unnecessary_lambdas

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
    gh.lazySingleton<_i10.SignUpRemoteDatasource>(
        () => _i10.SignUpRemoteDatasourceImpl(
              gh<_i8.AuthService>(),
              gh<_i9.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i11.SignUpRepository>(
        () => _i12.SignUpRepositoryImpl(gh<_i10.SignUpRemoteDatasource>()));
    gh.lazySingleton<_i13.SignUpUsecase>(
        () => _i13.SignUpUsecase(gh<_i11.SignUpRepository>()));
    gh.lazySingleton<_i14.AppRemoteDatasource>(
        () => _i14.AppRemoteDatasourceImpl(gh<_i8.AuthService>()));
    gh.lazySingleton<_i15.AppRepository>(
        () => _i16.AppRepositoryImpl(gh<_i14.AppRemoteDatasource>()));
    gh.lazySingleton<_i17.SignInWithEmailUsecase>(
        () => _i17.SignInWithEmailUsecase(gh<_i15.AppRepository>()));
    gh.factory<_i18.SignUpCubit>(
        () => _i18.SignUpCubit(gh<_i13.SignUpUsecase>()));
    gh.factory<_i19.AppCubit>(
        () => _i19.AppCubit(gh<_i17.SignInWithEmailUsecase>()));
    return this;
  }
}

class _$InjectionModule extends _i20.InjectionModule {}
