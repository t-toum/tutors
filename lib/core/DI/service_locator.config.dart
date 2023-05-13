// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

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
import 'package:shared_preferences/shared_preferences.dart' as _i9;
import 'package:tutors/core/DI/register_modules.dart' as _i57;
import 'package:tutors/core/services/auth_service.dart' as _i11;
import 'package:tutors/core/services/cloud_firestore_service.dart' as _i12;
import 'package:tutors/core/services/shared_preference_service.dart' as _i19;
import 'package:tutors/core/services/storage_service.dart' as _i10;
import 'package:tutors/features/account/data/datasources/account_remote_datasource.dart'
    as _i30;
import 'package:tutors/features/account/data/repositories/account_repository_impl.dart'
    as _i32;
import 'package:tutors/features/account/domain/repositories/account_repository.dart'
    as _i31;
import 'package:tutors/features/account/domain/usecases/add_education_usecase.dart'
    as _i33;
import 'package:tutors/features/account/domain/usecases/add_experience_usecase.dart'
    as _i34;
import 'package:tutors/features/account/domain/usecases/delete_education_usecase.dart'
    as _i38;
import 'package:tutors/features/account/domain/usecases/delete_experience_usecase.dart'
    as _i39;
import 'package:tutors/features/account/domain/usecases/get_current_user_usecase.dart'
    as _i42;
import 'package:tutors/features/account/domain/usecases/update_education_usecase.dart'
    as _i50;
import 'package:tutors/features/account/domain/usecases/update_experience_usecase.dart'
    as _i51;
import 'package:tutors/features/account/domain/usecases/update_user_profile.dart'
    as _i52;
import 'package:tutors/features/account/domain/usecases/upload_image_usecase.dart'
    as _i53;
import 'package:tutors/features/account/presentation/cubit/account_cubit.dart'
    as _i54;
import 'package:tutors/features/app/data/datasources/app_remote_datasource.dart'
    as _i35;
import 'package:tutors/features/app/data/repositories/app_repository_impl.dart'
    as _i37;
import 'package:tutors/features/app/domain/repository/app_repository.dart'
    as _i36;
import 'package:tutors/features/app/domain/usecases/get_current_user_auth_usecase.dart'
    as _i40;
import 'package:tutors/features/app/domain/usecases/get_user_usecase.dart'
    as _i43;
import 'package:tutors/features/app/domain/usecases/save_user_data_usecase.dart'
    as _i45;
import 'package:tutors/features/app/domain/usecases/sign_in_google_usecase.dart'
    as _i48;
import 'package:tutors/features/app/presentation/cubit/app_cubit.dart' as _i55;
import 'package:tutors/features/courses/presentation/cubit/course_cubit.dart'
    as _i56;
import 'package:tutors/features/home/data/datasources/home_remote_datasource.dart'
    as _i13;
import 'package:tutors/features/home/data/repositories/home_ropository_impl.dart'
    as _i15;
import 'package:tutors/features/home/domain/repositories/home_repository.dart'
    as _i14;
import 'package:tutors/features/home/domain/usecases/get_current_user_usecase.dart'
    as _i41;
import 'package:tutors/features/home/presentation/cubit/home_cubit.dart'
    as _i44;
import 'package:tutors/features/settings/data/datasources/setting_remote_datasource.dart'
    as _i16;
import 'package:tutors/features/settings/data/repositories/setting_repository_impl.dart'
    as _i18;
import 'package:tutors/features/settings/domain/repositories/setting_repository.dart'
    as _i17;
import 'package:tutors/features/settings/domain/usecases/sign_out_usecase.dart'
    as _i24;
import 'package:tutors/features/settings/presentation/cubit/setting_cubit.dart'
    as _i46;
import 'package:tutors/features/sign_in/data/datasources/sign_in_remote_datasorece.dart'
    as _i20;
import 'package:tutors/features/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i22;
import 'package:tutors/features/sign_in/domain/repositories/sign_in_repository.dart'
    as _i21;
import 'package:tutors/features/sign_in/domain/usecases/sign_in_usecase.dart'
    as _i23;
import 'package:tutors/features/sign_in/presentation/cubit/sign_in_cubit.dart'
    as _i47;
import 'package:tutors/features/sign_up/data/datasources/sign_up_remote_datasorece.dart'
    as _i25;
import 'package:tutors/features/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i27;
import 'package:tutors/features/sign_up/domain/repositories/sign_up_repository.dart'
    as _i26;
import 'package:tutors/features/sign_up/domain/usecases/sign_up_usecase.dart'
    as _i28;
import 'package:tutors/features/sign_up/domain/usecases/update_user_role_usecase.dart'
    as _i29;
import 'package:tutors/features/sign_up/presentation/cubit/sign_up_cubit.dart'
    as _i49;

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
    await gh.factoryAsync<_i9.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i10.StorageService>(
        () => _i10.StorageServiceImpl(gh<_i5.FirebaseStorage>()));
    gh.singleton<_i11.AuthService>(_i11.AuthService(gh<_i3.FirebaseAuth>()));
    gh.lazySingleton<_i12.CouldFireStoreService>(
        () => _i12.CouldFireStoreService(gh<_i4.FirebaseFirestore>()));
    gh.lazySingleton<_i13.HomeRemoteDatasource>(
        () => _i13.HomeRemoteDatasourceImpl(
              gh<_i11.AuthService>(),
              gh<_i12.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i14.HomeRepository>(
        () => _i15.HomeRepositoryImpl(gh<_i13.HomeRemoteDatasource>()));
    gh.lazySingleton<_i16.SettingRemoteDatasource>(
        () => _i16.SettingRemoteDatasourceImpl(gh<_i11.AuthService>()));
    gh.lazySingleton<_i17.SettingRepository>(
        () => _i18.SettingRepositoryImpl(gh<_i16.SettingRemoteDatasource>()));
    gh.lazySingleton<_i19.SharedPreferenceService>(
        () => _i19.SharedPreferenceServiceImpl(gh<_i9.SharedPreferences>()));
    gh.lazySingleton<_i20.SignInRemoteDatasource>(
        () => _i20.SignInRemoteDatasourceImpl(gh<_i11.AuthService>()));
    gh.lazySingleton<_i21.SignInRepository>(
        () => _i22.SignInRepositoryImpl(gh<_i20.SignInRemoteDatasource>()));
    gh.lazySingleton<_i23.SignInUsecase>(
        () => _i23.SignInUsecase(gh<_i21.SignInRepository>()));
    gh.lazySingleton<_i24.SignOutUsecase>(
        () => _i24.SignOutUsecase(gh<_i17.SettingRepository>()));
    gh.lazySingleton<_i25.SignUpRemoteDatasource>(
        () => _i25.SignUpRemoteDatasourceImpl(
              gh<_i11.AuthService>(),
              gh<_i12.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i26.SignUpRepository>(
        () => _i27.SignUpRepositoryImpl(gh<_i25.SignUpRemoteDatasource>()));
    gh.lazySingleton<_i28.SignUpUsecase>(
        () => _i28.SignUpUsecase(gh<_i26.SignUpRepository>()));
    gh.lazySingleton<_i29.UpdateUserRoleUsecase>(
        () => _i29.UpdateUserRoleUsecase(gh<_i26.SignUpRepository>()));
    gh.lazySingleton<_i30.AccountRemoteDatasource>(
        () => _i30.AccountRemoteDatasourceImpl(
              gh<_i11.AuthService>(),
              gh<_i12.CouldFireStoreService>(),
              gh<_i10.StorageService>(),
            ));
    gh.lazySingleton<_i31.AccountRepository>(
        () => _i32.AccountRepositoryImpl(gh<_i30.AccountRemoteDatasource>()));
    gh.lazySingleton<_i33.AddEducationUsecase>(
        () => _i33.AddEducationUsecase(gh<_i31.AccountRepository>()));
    gh.lazySingleton<_i34.AddExperienceUsecase>(
        () => _i34.AddExperienceUsecase(gh<_i31.AccountRepository>()));
    gh.lazySingleton<_i35.AppRemoteDatasource>(
        () => _i35.AppRemoteDatasourceImpl(
              gh<_i11.AuthService>(),
              gh<_i12.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i36.AppRepository>(
        () => _i37.AppRepositoryImpl(gh<_i35.AppRemoteDatasource>()));
    gh.lazySingleton<_i38.DeleteEducatonUsecase>(
        () => _i38.DeleteEducatonUsecase(gh<_i31.AccountRepository>()));
    gh.lazySingleton<_i39.DeleteExperienceUsecase>(
        () => _i39.DeleteExperienceUsecase(gh<_i31.AccountRepository>()));
    gh.lazySingleton<_i40.GetCurrentUserAuthUsecase>(
        () => _i40.GetCurrentUserAuthUsecase(gh<_i36.AppRepository>()));
    gh.lazySingleton<_i41.GetCurrentUserDataUsecase>(
        () => _i41.GetCurrentUserDataUsecase(gh<_i14.HomeRepository>()));
    gh.lazySingleton<_i42.GetCurrentUserUsecase>(
        () => _i42.GetCurrentUserUsecase(gh<_i31.AccountRepository>()));
    gh.lazySingleton<_i43.GetUserUsecase>(
        () => _i43.GetUserUsecase(gh<_i36.AppRepository>()));
    gh.factory<_i44.HomeCubit>(
        () => _i44.HomeCubit(gh<_i41.GetCurrentUserDataUsecase>()));
    gh.lazySingleton<_i45.SaveUserDataUsecase>(
        () => _i45.SaveUserDataUsecase(gh<_i36.AppRepository>()));
    gh.factory<_i46.SettingCubit>(
        () => _i46.SettingCubit(gh<_i24.SignOutUsecase>()));
    gh.factory<_i47.SignInCubit>(() => _i47.SignInCubit(
          gh<_i23.SignInUsecase>(),
          gh<_i43.GetUserUsecase>(),
        ));
    gh.lazySingleton<_i48.SignInWithGoogleUsecase>(
        () => _i48.SignInWithGoogleUsecase(gh<_i36.AppRepository>()));
    gh.factory<_i49.SignUpCubit>(() => _i49.SignUpCubit(
          gh<_i28.SignUpUsecase>(),
          gh<_i29.UpdateUserRoleUsecase>(),
        ));
    gh.lazySingleton<_i50.UpdateEducationUsecase>(
        () => _i50.UpdateEducationUsecase(gh<_i31.AccountRepository>()));
    gh.lazySingleton<_i51.UpdateExperienceUsecase>(
        () => _i51.UpdateExperienceUsecase(gh<_i31.AccountRepository>()));
    gh.lazySingleton<_i52.UpdateUserProfile>(
        () => _i52.UpdateUserProfile(gh<_i31.AccountRepository>()));
    gh.lazySingleton<_i53.UploadImageUsecase>(
        () => _i53.UploadImageUsecase(gh<_i31.AccountRepository>()));
    gh.factory<_i54.AccountCubit>(() => _i54.AccountCubit(
          gh<_i42.GetCurrentUserUsecase>(),
          gh<_i6.ImagePicker>(),
          gh<_i53.UploadImageUsecase>(),
          gh<_i52.UpdateUserProfile>(),
          gh<_i34.AddExperienceUsecase>(),
          gh<_i39.DeleteExperienceUsecase>(),
          gh<_i51.UpdateExperienceUsecase>(),
          gh<_i33.AddEducationUsecase>(),
          gh<_i38.DeleteEducatonUsecase>(),
          gh<_i50.UpdateEducationUsecase>(),
        ));
    gh.factory<_i55.AppCubit>(() => _i55.AppCubit(
          gh<_i40.GetCurrentUserAuthUsecase>(),
          gh<_i43.GetUserUsecase>(),
          gh<_i48.SignInWithGoogleUsecase>(),
          gh<_i45.SaveUserDataUsecase>(),
        ));
    gh.factory<_i56.CourseCubit>(
        () => _i56.CourseCubit(gh<_i41.GetCurrentUserDataUsecase>()));
    return this;
  }
}

class _$InjectionModule extends _i57.InjectionModule {}
