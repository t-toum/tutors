// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_storage/firebase_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i7;
import 'package:logger/logger.dart' as _i8;
import 'package:shared_preferences/shared_preferences.dart' as _i10;
import 'package:tutors/core/DI/register_modules.dart' as _i48;
import 'package:tutors/core/services/auth_service.dart' as _i12;
import 'package:tutors/core/services/cloud_firestore_service.dart' as _i13;
import 'package:tutors/core/services/shared_preference_service.dart' as _i17;
import 'package:tutors/core/services/storage_service.dart' as _i11;
import 'package:tutors/features/account/data/datasources/account_remote_datasource.dart'
    as _i28;
import 'package:tutors/features/account/data/repositories/account_repository_impl.dart'
    as _i30;
import 'package:tutors/features/account/domain/repositories/account_repository.dart'
    as _i29;
import 'package:tutors/features/account/domain/usecases/get_current_user_usecase.dart'
    as _i36;
import 'package:tutors/features/account/domain/usecases/update_user_profile.dart'
    as _i43;
import 'package:tutors/features/account/domain/usecases/upload_image_usecase.dart'
    as _i44;
import 'package:tutors/features/account/presentation/cubit/account_cubit.dart'
    as _i45;
import 'package:tutors/features/app/data/datasources/app_remote_datasource.dart'
    as _i31;
import 'package:tutors/features/app/data/repositories/app_repository_impl.dart'
    as _i33;
import 'package:tutors/features/app/domain/repository/app_repository.dart'
    as _i32;
import 'package:tutors/features/app/domain/usecases/get_current_user_auth_usecase.dart'
    as _i34;
import 'package:tutors/features/app/domain/usecases/get_user_usecase.dart'
    as _i37;
import 'package:tutors/features/app/domain/usecases/save_user_data_usecase.dart'
    as _i39;
import 'package:tutors/features/app/domain/usecases/sign_in_google_usecase.dart'
    as _i41;
import 'package:tutors/features/app/presentation/cubit/app_cubit.dart' as _i46;
import 'package:tutors/features/courses/presentation/cubit/course_cubit.dart'
    as _i47;
import 'package:tutors/features/home/data/datasources/home_remote_datasource.dart'
    as _i14;
import 'package:tutors/features/home/data/repositories/home_ropository_impl.dart'
    as _i16;
import 'package:tutors/features/home/domain/repositories/home_repository.dart'
    as _i15;
import 'package:tutors/features/home/domain/usecases/get_current_user_usecase.dart'
    as _i35;
import 'package:tutors/features/home/domain/usecases/sign_out_usecase.dart'
    as _i22;
import 'package:tutors/features/home/presentation/cubit/home_cubit.dart'
    as _i38;
import 'package:tutors/features/settings/presentation/cubit/setting_cubit.dart'
    as _i9;
import 'package:tutors/features/sign_in/data/datasources/sign_in_remote_datasorece.dart'
    as _i18;
import 'package:tutors/features/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i20;
import 'package:tutors/features/sign_in/domain/repositories/sign_in_repository.dart'
    as _i19;
import 'package:tutors/features/sign_in/domain/usecases/sign_in_usecase.dart'
    as _i21;
import 'package:tutors/features/sign_in/presentation/cubit/sign_in_cubit.dart'
    as _i40;
import 'package:tutors/features/sign_up/data/datasources/sign_up_remote_datasorece.dart'
    as _i23;
import 'package:tutors/features/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i25;
import 'package:tutors/features/sign_up/domain/repositories/sign_up_repository.dart'
    as _i24;
import 'package:tutors/features/sign_up/domain/usecases/sign_up_usecase.dart'
    as _i26;
import 'package:tutors/features/sign_up/domain/usecases/update_user_role_usecase.dart'
    as _i27;
import 'package:tutors/features/sign_up/presentation/cubit/sign_up_cubit.dart'
    as _i42; // ignore_for_file: unnecessary_lambdas

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
    gh.lazySingleton<_i5.FirebaseStorage>(() => injectionModule.storage);
    gh.lazySingleton<_i6.ImagePicker>(() => injectionModule.picker);
    gh.factory<_i7.InternetConnectionChecker>(
        () => injectionModule.internetChecker);
    gh.factory<_i8.Logger>(() => injectionModule.logger);
    gh.factory<_i9.SettingCubit>(() => _i9.SettingCubit());
    await gh.factoryAsync<_i10.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i11.StorageService>(
        () => _i11.StorageServiceImpl(gh<_i5.FirebaseStorage>()));
    gh.singleton<_i12.AuthService>(_i12.AuthService(gh<_i3.FirebaseAuth>()));
    gh.lazySingleton<_i13.CouldFireStoreService>(
        () => _i13.CouldFireStoreServiceImpl(gh<_i4.FirebaseFirestore>()));
    gh.lazySingleton<_i14.HomeRemoteDatasource>(
        () => _i14.HomeRemoteDatasourceImpl(
              gh<_i12.AuthService>(),
              gh<_i13.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i15.HomeRepository>(
        () => _i16.HomeRepositoryImpl(gh<_i14.HomeRemoteDatasource>()));
    gh.lazySingleton<_i17.SharedPreferenceService>(
        () => _i17.SharedPreferenceServiceImpl(gh<_i10.SharedPreferences>()));
    gh.lazySingleton<_i18.SignInRemoteDatasource>(
        () => _i18.SignInRemoteDatasourceImpl(gh<_i12.AuthService>()));
    gh.lazySingleton<_i19.SignInRepository>(
        () => _i20.SignInRepositoryImpl(gh<_i18.SignInRemoteDatasource>()));
    gh.lazySingleton<_i21.SignInUsecase>(
        () => _i21.SignInUsecase(gh<_i19.SignInRepository>()));
    gh.lazySingleton<_i22.SignOutUsecase>(
        () => _i22.SignOutUsecase(gh<_i15.HomeRepository>()));
    gh.lazySingleton<_i23.SignUpRemoteDatasource>(
        () => _i23.SignUpRemoteDatasourceImpl(
              gh<_i12.AuthService>(),
              gh<_i13.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i24.SignUpRepository>(
        () => _i25.SignUpRepositoryImpl(gh<_i23.SignUpRemoteDatasource>()));
    gh.lazySingleton<_i26.SignUpUsecase>(
        () => _i26.SignUpUsecase(gh<_i24.SignUpRepository>()));
    gh.lazySingleton<_i27.UpdateUserRoleUsecase>(
        () => _i27.UpdateUserRoleUsecase(gh<_i24.SignUpRepository>()));
    gh.lazySingleton<_i28.AccountRemoteDatasource>(
        () => _i28.AccountRemoteDatasourceImpl(
              gh<_i12.AuthService>(),
              gh<_i13.CouldFireStoreService>(),
              gh<_i11.StorageService>(),
            ));
    gh.lazySingleton<_i29.AccountRepository>(
        () => _i30.AccountRepositoryImpl(gh<_i28.AccountRemoteDatasource>()));
    gh.lazySingleton<_i31.AppRemoteDatasource>(
        () => _i31.AppRemoteDatasourceImpl(
              gh<_i12.AuthService>(),
              gh<_i13.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i32.AppRepository>(
        () => _i33.AppRepositoryImpl(gh<_i31.AppRemoteDatasource>()));
    gh.lazySingleton<_i34.GetCurrentUserAuthUsecase>(
        () => _i34.GetCurrentUserAuthUsecase(gh<_i32.AppRepository>()));
    gh.lazySingleton<_i35.GetCurrentUserDataUsecase>(
        () => _i35.GetCurrentUserDataUsecase(gh<_i15.HomeRepository>()));
    gh.lazySingleton<_i36.GetCurrentUserUsecase>(
        () => _i36.GetCurrentUserUsecase(gh<_i29.AccountRepository>()));
    gh.lazySingleton<_i37.GetUserUsecase>(
        () => _i37.GetUserUsecase(gh<_i32.AppRepository>()));
    gh.factory<_i38.HomeCubit>(() => _i38.HomeCubit(
          gh<_i22.SignOutUsecase>(),
          gh<_i35.GetCurrentUserDataUsecase>(),
        ));
    gh.lazySingleton<_i39.SaveUserDataUsecase>(
        () => _i39.SaveUserDataUsecase(gh<_i32.AppRepository>()));
    gh.factory<_i40.SignInCubit>(() => _i40.SignInCubit(
          gh<_i21.SignInUsecase>(),
          gh<_i37.GetUserUsecase>(),
        ));
    gh.lazySingleton<_i41.SignInWithGoogleUsecase>(
        () => _i41.SignInWithGoogleUsecase(gh<_i32.AppRepository>()));
    gh.factory<_i42.SignUpCubit>(() => _i42.SignUpCubit(
          gh<_i26.SignUpUsecase>(),
          gh<_i27.UpdateUserRoleUsecase>(),
        ));
    gh.lazySingleton<_i43.UpdateUserProfile>(
        () => _i43.UpdateUserProfile(gh<_i29.AccountRepository>()));
    gh.lazySingleton<_i44.UploadImageUsecase>(
        () => _i44.UploadImageUsecase(gh<_i29.AccountRepository>()));
    gh.factory<_i45.AccountCubit>(() => _i45.AccountCubit(
          gh<_i36.GetCurrentUserUsecase>(),
          gh<_i6.ImagePicker>(),
          gh<_i44.UploadImageUsecase>(),
          gh<_i43.UpdateUserProfile>(),
        ));
    gh.factory<_i46.AppCubit>(() => _i46.AppCubit(
          gh<_i34.GetCurrentUserAuthUsecase>(),
          gh<_i37.GetUserUsecase>(),
          gh<_i41.SignInWithGoogleUsecase>(),
          gh<_i39.SaveUserDataUsecase>(),
        ));
    gh.factory<_i47.CourseCubit>(
        () => _i47.CourseCubit(gh<_i35.GetCurrentUserDataUsecase>()));
    return this;
  }
}

class _$InjectionModule extends _i48.InjectionModule {}
