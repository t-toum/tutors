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
import 'package:tutors/core/DI/register_modules.dart' as _i64;
import 'package:tutors/core/services/auth_service.dart' as _i11;
import 'package:tutors/core/services/cloud_firestore_service.dart' as _i12;
import 'package:tutors/core/services/shared_preference_service.dart' as _i20;
import 'package:tutors/core/services/storage_service.dart' as _i10;
import 'package:tutors/features/account/data/datasources/account_remote_datasource.dart'
    as _i30;
import 'package:tutors/features/account/data/repositories/account_repository_impl.dart'
    as _i32;
import 'package:tutors/features/account/domain/repositories/account_repository.dart'
    as _i31;
import 'package:tutors/features/account/domain/usecases/add_education_usecase.dart'
    as _i34;
import 'package:tutors/features/account/domain/usecases/add_experience_usecase.dart'
    as _i35;
import 'package:tutors/features/account/domain/usecases/delete_education_usecase.dart'
    as _i39;
import 'package:tutors/features/account/domain/usecases/delete_experience_usecase.dart'
    as _i40;
import 'package:tutors/features/account/domain/usecases/get_current_user_usecase.dart'
    as _i43;
import 'package:tutors/features/account/domain/usecases/update_education_usecase.dart'
    as _i54;
import 'package:tutors/features/account/domain/usecases/update_experience_usecase.dart'
    as _i55;
import 'package:tutors/features/account/domain/usecases/update_user_profile.dart'
    as _i56;
import 'package:tutors/features/account/domain/usecases/upload_image_usecase.dart'
    as _i57;
import 'package:tutors/features/account/presentation/cubit/account_cubit.dart'
    as _i58;
import 'package:tutors/features/app/data/datasources/app_remote_datasource.dart'
    as _i36;
import 'package:tutors/features/app/data/repositories/app_repository_impl.dart'
    as _i38;
import 'package:tutors/features/app/domain/repository/app_repository.dart'
    as _i37;
import 'package:tutors/features/app/domain/usecases/get_current_user_auth_usecase.dart'
    as _i41;
import 'package:tutors/features/app/domain/usecases/get_user_usecase.dart'
    as _i44;
import 'package:tutors/features/app/domain/usecases/save_user_data_usecase.dart'
    as _i46;
import 'package:tutors/features/app/domain/usecases/sign_in_google_usecase.dart'
    as _i51;
import 'package:tutors/features/app/presentation/cubit/app_cubit.dart' as _i59;
import 'package:tutors/features/courses/data/datasources/course_remote_datasource.dart'
    as _i13;
import 'package:tutors/features/courses/data/repositories/course_repository_impl.dart'
    as _i15;
import 'package:tutors/features/courses/domain/repositories/course_repository.dart'
    as _i14;
import 'package:tutors/features/courses/domain/usecases/add_course_usecase.dart'
    as _i33;
import 'package:tutors/features/courses/presentation/cubit/course_cubit.dart'
    as _i60;
import 'package:tutors/features/home/data/datasources/home_remote_datasource.dart'
    as _i16;
import 'package:tutors/features/home/data/repositories/home_ropository_impl.dart'
    as _i18;
import 'package:tutors/features/home/domain/repositories/home_repository.dart'
    as _i17;
import 'package:tutors/features/home/domain/usecases/get_current_user_usecase.dart'
    as _i42;
import 'package:tutors/features/home/presentation/cubit/home_cubit.dart'
    as _i45;
import 'package:tutors/features/settings/data/datasources/setting_local_datasource.dart'
    as _i47;
import 'package:tutors/features/settings/data/datasources/setting_remote_datasource.dart'
    as _i19;
import 'package:tutors/features/settings/data/repositories/setting_repository_impl.dart'
    as _i49;
import 'package:tutors/features/settings/domain/repositories/setting_repository.dart'
    as _i48;
import 'package:tutors/features/settings/domain/usecases/get_language_usecase.dart'
    as _i61;
import 'package:tutors/features/settings/domain/usecases/set_language_usecase.dart'
    as _i62;
import 'package:tutors/features/settings/domain/usecases/sign_out_usecase.dart'
    as _i52;
import 'package:tutors/features/settings/presentation/cubit/setting_cubit.dart'
    as _i63;
import 'package:tutors/features/sign_in/data/datasources/sign_in_remote_datasorece.dart'
    as _i21;
import 'package:tutors/features/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i23;
import 'package:tutors/features/sign_in/domain/repositories/sign_in_repository.dart'
    as _i22;
import 'package:tutors/features/sign_in/domain/usecases/sign_in_usecase.dart'
    as _i24;
import 'package:tutors/features/sign_in/presentation/cubit/sign_in_cubit.dart'
    as _i50;
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
    as _i53;

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
    gh.lazySingleton<_i13.CourseRemoteDatasource>(() =>
        _i13.CourseRemoteDatasourceImpl(gh<_i12.CouldFireStoreService>()));
    gh.lazySingleton<_i14.CourseRepository>(
        () => _i15.CourseRepositoryImpl(gh<_i13.CourseRemoteDatasource>()));
    gh.lazySingleton<_i16.HomeRemoteDatasource>(
        () => _i16.HomeRemoteDatasourceImpl(
              gh<_i11.AuthService>(),
              gh<_i12.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i17.HomeRepository>(
        () => _i18.HomeRepositoryImpl(gh<_i16.HomeRemoteDatasource>()));
    gh.lazySingleton<_i19.SettingRemoteDatasource>(
        () => _i19.SettingRemoteDatasourceImpl(gh<_i11.AuthService>()));
    gh.lazySingleton<_i20.SharedPreferenceService>(
        () => _i20.SharedPreferenceServiceImpl(gh<_i9.SharedPreferences>()));
    gh.lazySingleton<_i21.SignInRemoteDatasource>(
        () => _i21.SignInRemoteDatasourceImpl(gh<_i11.AuthService>()));
    gh.lazySingleton<_i22.SignInRepository>(
        () => _i23.SignInRepositoryImpl(gh<_i21.SignInRemoteDatasource>()));
    gh.lazySingleton<_i24.SignInUsecase>(
        () => _i24.SignInUsecase(gh<_i22.SignInRepository>()));
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
    gh.lazySingleton<_i33.AddCourseUsecase>(
        () => _i33.AddCourseUsecase(gh<_i14.CourseRepository>()));
    gh.lazySingleton<_i34.AddEducationUsecase>(
        () => _i34.AddEducationUsecase(gh<_i31.AccountRepository>()));
    gh.lazySingleton<_i35.AddExperienceUsecase>(
        () => _i35.AddExperienceUsecase(gh<_i31.AccountRepository>()));
    gh.lazySingleton<_i36.AppRemoteDatasource>(
        () => _i36.AppRemoteDatasourceImpl(
              gh<_i11.AuthService>(),
              gh<_i12.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i37.AppRepository>(
        () => _i38.AppRepositoryImpl(gh<_i36.AppRemoteDatasource>()));
    gh.lazySingleton<_i39.DeleteEducatonUsecase>(
        () => _i39.DeleteEducatonUsecase(gh<_i31.AccountRepository>()));
    gh.lazySingleton<_i40.DeleteExperienceUsecase>(
        () => _i40.DeleteExperienceUsecase(gh<_i31.AccountRepository>()));
    gh.lazySingleton<_i41.GetCurrentUserAuthUsecase>(
        () => _i41.GetCurrentUserAuthUsecase(gh<_i37.AppRepository>()));
    gh.lazySingleton<_i42.GetCurrentUserDataUsecase>(
        () => _i42.GetCurrentUserDataUsecase(gh<_i17.HomeRepository>()));
    gh.lazySingleton<_i43.GetCurrentUserUsecase>(
        () => _i43.GetCurrentUserUsecase(gh<_i31.AccountRepository>()));
    gh.lazySingleton<_i44.GetUserUsecase>(
        () => _i44.GetUserUsecase(gh<_i37.AppRepository>()));
    gh.factory<_i45.HomeCubit>(
        () => _i45.HomeCubit(gh<_i42.GetCurrentUserDataUsecase>()));
    gh.lazySingleton<_i46.SaveUserDataUsecase>(
        () => _i46.SaveUserDataUsecase(gh<_i37.AppRepository>()));
    gh.lazySingleton<_i47.SettingLocalDatasource>(() =>
        _i47.SettingLocalDatasourceImpl(gh<_i20.SharedPreferenceService>()));
    gh.lazySingleton<_i48.SettingRepository>(() => _i49.SettingRepositoryImpl(
          gh<_i19.SettingRemoteDatasource>(),
          gh<_i47.SettingLocalDatasource>(),
        ));
    gh.factory<_i50.SignInCubit>(() => _i50.SignInCubit(
          gh<_i24.SignInUsecase>(),
          gh<_i44.GetUserUsecase>(),
        ));
    gh.lazySingleton<_i51.SignInWithGoogleUsecase>(
        () => _i51.SignInWithGoogleUsecase(gh<_i37.AppRepository>()));
    gh.lazySingleton<_i52.SignOutUsecase>(
        () => _i52.SignOutUsecase(gh<_i48.SettingRepository>()));
    gh.factory<_i53.SignUpCubit>(() => _i53.SignUpCubit(
          gh<_i28.SignUpUsecase>(),
          gh<_i29.UpdateUserRoleUsecase>(),
        ));
    gh.lazySingleton<_i54.UpdateEducationUsecase>(
        () => _i54.UpdateEducationUsecase(gh<_i31.AccountRepository>()));
    gh.lazySingleton<_i55.UpdateExperienceUsecase>(
        () => _i55.UpdateExperienceUsecase(gh<_i31.AccountRepository>()));
    gh.lazySingleton<_i56.UpdateUserProfile>(
        () => _i56.UpdateUserProfile(gh<_i31.AccountRepository>()));
    gh.lazySingleton<_i57.UploadImageUsecase>(
        () => _i57.UploadImageUsecase(gh<_i31.AccountRepository>()));
    gh.factory<_i58.AccountCubit>(() => _i58.AccountCubit(
          gh<_i43.GetCurrentUserUsecase>(),
          gh<_i6.ImagePicker>(),
          gh<_i57.UploadImageUsecase>(),
          gh<_i56.UpdateUserProfile>(),
          gh<_i35.AddExperienceUsecase>(),
          gh<_i40.DeleteExperienceUsecase>(),
          gh<_i55.UpdateExperienceUsecase>(),
          gh<_i34.AddEducationUsecase>(),
          gh<_i39.DeleteEducatonUsecase>(),
          gh<_i54.UpdateEducationUsecase>(),
        ));
    gh.factory<_i59.AppCubit>(() => _i59.AppCubit(
          gh<_i41.GetCurrentUserAuthUsecase>(),
          gh<_i44.GetUserUsecase>(),
          gh<_i51.SignInWithGoogleUsecase>(),
          gh<_i46.SaveUserDataUsecase>(),
        ));
    gh.factory<_i60.CourseCubit>(() => _i60.CourseCubit(
          gh<_i42.GetCurrentUserDataUsecase>(),
          gh<_i33.AddCourseUsecase>(),
        ));
    gh.lazySingleton<_i61.GetLanguageUsecase>(
        () => _i61.GetLanguageUsecase(gh<_i48.SettingRepository>()));
    gh.lazySingleton<_i62.SetLanguageUsecase>(
        () => _i62.SetLanguageUsecase(gh<_i48.SettingRepository>()));
    gh.factory<_i63.SettingCubit>(() => _i63.SettingCubit(
          gh<_i52.SignOutUsecase>(),
          gh<_i61.GetLanguageUsecase>(),
          gh<_i62.SetLanguageUsecase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i64.InjectionModule {}
