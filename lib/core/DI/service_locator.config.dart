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
import 'package:tutors/core/DI/register_modules.dart' as _i81;
import 'package:tutors/core/services/auth_service.dart' as _i11;
import 'package:tutors/core/services/cloud_firestore_service.dart' as _i12;
import 'package:tutors/core/services/shared_preference_service.dart' as _i31;
import 'package:tutors/core/services/storage_service.dart' as _i10;
import 'package:tutors/features/account/data/datasources/account_remote_datasource.dart'
    as _i41;
import 'package:tutors/features/account/data/repositories/account_repository_impl.dart'
    as _i43;
import 'package:tutors/features/account/domain/repositories/account_repository.dart'
    as _i42;
import 'package:tutors/features/account/domain/usecases/add_education_usecase.dart'
    as _i45;
import 'package:tutors/features/account/domain/usecases/add_experience_usecase.dart'
    as _i46;
import 'package:tutors/features/account/domain/usecases/delete_education_usecase.dart'
    as _i51;
import 'package:tutors/features/account/domain/usecases/delete_experience_usecase.dart'
    as _i52;
import 'package:tutors/features/account/domain/usecases/get_current_user_usecase.dart'
    as _i56;
import 'package:tutors/features/account/domain/usecases/get_profile_usecase.dart'
    as _i57;
import 'package:tutors/features/account/domain/usecases/update_education_usecase.dart'
    as _i70;
import 'package:tutors/features/account/domain/usecases/update_experience_usecase.dart'
    as _i71;
import 'package:tutors/features/account/domain/usecases/update_user_profile.dart'
    as _i72;
import 'package:tutors/features/account/domain/usecases/upload_image_usecase.dart'
    as _i73;
import 'package:tutors/features/account/presentation/cubit/account_cubit.dart'
    as _i74;
import 'package:tutors/features/app/data/datasources/app_remote_datasource.dart'
    as _i48;
import 'package:tutors/features/app/data/repositories/app_repository_impl.dart'
    as _i50;
import 'package:tutors/features/app/domain/repository/app_repository.dart'
    as _i49;
import 'package:tutors/features/app/domain/usecases/get_current_user_auth_usecase.dart'
    as _i54;
import 'package:tutors/features/app/domain/usecases/get_user_usecase.dart'
    as _i59;
import 'package:tutors/features/app/domain/usecases/save_user_data_usecase.dart'
    as _i62;
import 'package:tutors/features/app/domain/usecases/sign_in_google_usecase.dart'
    as _i67;
import 'package:tutors/features/app/presentation/cubit/app_cubit.dart' as _i75;
import 'package:tutors/features/courses/data/datasources/course_remote_datasource.dart'
    as _i13;
import 'package:tutors/features/courses/data/repositories/course_repository_impl.dart'
    as _i15;
import 'package:tutors/features/courses/domain/repositories/course_repository.dart'
    as _i14;
import 'package:tutors/features/courses/domain/usecases/add_course_usecase.dart'
    as _i44;
import 'package:tutors/features/courses/domain/usecases/get_all_course_usecase.dart'
    as _i19;
import 'package:tutors/features/courses/domain/usecases/get_categories_usecase.dart'
    as _i20;
import 'package:tutors/features/courses/domain/usecases/register_usecase.dart'
    as _i28;
import 'package:tutors/features/courses/presentation/cubit/course_cubit.dart'
    as _i76;
import 'package:tutors/features/favorites/data/datasources/favorite_remote_datasource.dart'
    as _i16;
import 'package:tutors/features/favorites/data/repositories/favorite_repository_impl.dart'
    as _i18;
import 'package:tutors/features/favorites/domain/repositories/favorite_repository.dart'
    as _i17;
import 'package:tutors/features/favorites/domain/usecases/add_favorite_usecase.dart'
    as _i47;
import 'package:tutors/features/favorites/domain/usecases/get_favorite_usecase.dart'
    as _i21;
import 'package:tutors/features/favorites/domain/usecases/remove_favorite_usecase.dart'
    as _i29;
import 'package:tutors/features/favorites/presentation/cubit/favorite_cubit.dart'
    as _i77;
import 'package:tutors/features/home/data/datasources/home_remote_datasource.dart'
    as _i22;
import 'package:tutors/features/home/data/repositories/home_ropository_impl.dart'
    as _i24;
import 'package:tutors/features/home/domain/repositories/home_repository.dart'
    as _i23;
import 'package:tutors/features/home/domain/usecases/get_current_user_usecase.dart'
    as _i55;
import 'package:tutors/features/home/presentation/cubit/home_cubit.dart'
    as _i60;
import 'package:tutors/features/my_courses/data/datasources/my_course_remote_datasource.dart'
    as _i25;
import 'package:tutors/features/my_courses/data/repositories/my_course_repository_impl.dart'
    as _i27;
import 'package:tutors/features/my_courses/domain/repositories/my_course_repository.dart'
    as _i26;
import 'package:tutors/features/my_courses/domain/usecases/get_created_course_usecase.dart'
    as _i53;
import 'package:tutors/features/my_courses/domain/usecases/get_registered_course_usecase.dart'
    as _i58;
import 'package:tutors/features/my_courses/presentation/cubit/my_course_cubit.dart'
    as _i61;
import 'package:tutors/features/settings/data/datasources/setting_local_datasource.dart'
    as _i63;
import 'package:tutors/features/settings/data/datasources/setting_remote_datasource.dart'
    as _i30;
import 'package:tutors/features/settings/data/repositories/setting_repository_impl.dart'
    as _i65;
import 'package:tutors/features/settings/domain/repositories/setting_repository.dart'
    as _i64;
import 'package:tutors/features/settings/domain/usecases/get_language_usecase.dart'
    as _i78;
import 'package:tutors/features/settings/domain/usecases/set_language_usecase.dart'
    as _i79;
import 'package:tutors/features/settings/domain/usecases/sign_out_usecase.dart'
    as _i68;
import 'package:tutors/features/settings/presentation/cubit/setting_cubit.dart'
    as _i80;
import 'package:tutors/features/sign_in/data/datasources/sign_in_remote_datasorece.dart'
    as _i32;
import 'package:tutors/features/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i34;
import 'package:tutors/features/sign_in/domain/repositories/sign_in_repository.dart'
    as _i33;
import 'package:tutors/features/sign_in/domain/usecases/sign_in_usecase.dart'
    as _i35;
import 'package:tutors/features/sign_in/presentation/cubit/sign_in_cubit.dart'
    as _i66;
import 'package:tutors/features/sign_up/data/datasources/sign_up_remote_datasorece.dart'
    as _i36;
import 'package:tutors/features/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i38;
import 'package:tutors/features/sign_up/domain/repositories/sign_up_repository.dart'
    as _i37;
import 'package:tutors/features/sign_up/domain/usecases/sign_up_usecase.dart'
    as _i39;
import 'package:tutors/features/sign_up/domain/usecases/update_user_role_usecase.dart'
    as _i40;
import 'package:tutors/features/sign_up/presentation/cubit/sign_up_cubit.dart'
    as _i69;

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
    gh.lazySingleton<_i16.FavoriteRemoteDatasource>(() =>
        _i16.FavoriteRemoteDatasourceImpl(gh<_i12.CouldFireStoreService>()));
    gh.lazySingleton<_i17.FavoriteRepository>(
        () => _i18.FavoriteRepositoryImpl(gh<_i16.FavoriteRemoteDatasource>()));
    gh.lazySingleton<_i19.GetAllCourseUsecase>(
        () => _i19.GetAllCourseUsecase(gh<_i14.CourseRepository>()));
    gh.lazySingleton<_i20.GetCategoriesUsecase>(
        () => _i20.GetCategoriesUsecase(gh<_i14.CourseRepository>()));
    gh.lazySingleton<_i21.GetFavoriteUsecase>(
        () => _i21.GetFavoriteUsecase(gh<_i17.FavoriteRepository>()));
    gh.lazySingleton<_i22.HomeRemoteDatasource>(
        () => _i22.HomeRemoteDatasourceImpl(
              gh<_i11.AuthService>(),
              gh<_i12.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i23.HomeRepository>(
        () => _i24.HomeRepositoryImpl(gh<_i22.HomeRemoteDatasource>()));
    gh.lazySingleton<_i25.MyCourseRemoteDatasource>(
        () => _i25.MyCourseRemoteDatasourceImpl(
              gh<_i12.CouldFireStoreService>(),
              gh<_i11.AuthService>(),
            ));
    gh.lazySingleton<_i26.MyCourseRepository>(
        () => _i27.MyCourseRepositoryImpl(gh<_i25.MyCourseRemoteDatasource>()));
    gh.lazySingleton<_i28.RegisterUsecase>(
        () => _i28.RegisterUsecase(gh<_i14.CourseRepository>()));
    gh.lazySingleton<_i29.RemoveFavoriteUsecase>(
        () => _i29.RemoveFavoriteUsecase(gh<_i17.FavoriteRepository>()));
    gh.lazySingleton<_i30.SettingRemoteDatasource>(
        () => _i30.SettingRemoteDatasourceImpl(gh<_i11.AuthService>()));
    gh.lazySingleton<_i31.SharedPreferenceService>(
        () => _i31.SharedPreferenceServiceImpl(gh<_i9.SharedPreferences>()));
    gh.lazySingleton<_i32.SignInRemoteDatasource>(
        () => _i32.SignInRemoteDatasourceImpl(gh<_i11.AuthService>()));
    gh.lazySingleton<_i33.SignInRepository>(
        () => _i34.SignInRepositoryImpl(gh<_i32.SignInRemoteDatasource>()));
    gh.lazySingleton<_i35.SignInUsecase>(
        () => _i35.SignInUsecase(gh<_i33.SignInRepository>()));
    gh.lazySingleton<_i36.SignUpRemoteDatasource>(
        () => _i36.SignUpRemoteDatasourceImpl(
              gh<_i11.AuthService>(),
              gh<_i12.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i37.SignUpRepository>(
        () => _i38.SignUpRepositoryImpl(gh<_i36.SignUpRemoteDatasource>()));
    gh.lazySingleton<_i39.SignUpUsecase>(
        () => _i39.SignUpUsecase(gh<_i37.SignUpRepository>()));
    gh.lazySingleton<_i40.UpdateUserRoleUsecase>(
        () => _i40.UpdateUserRoleUsecase(gh<_i37.SignUpRepository>()));
    gh.lazySingleton<_i41.AccountRemoteDatasource>(
        () => _i41.AccountRemoteDatasourceImpl(
              gh<_i11.AuthService>(),
              gh<_i12.CouldFireStoreService>(),
              gh<_i10.StorageService>(),
            ));
    gh.lazySingleton<_i42.AccountRepository>(
        () => _i43.AccountRepositoryImpl(gh<_i41.AccountRemoteDatasource>()));
    gh.lazySingleton<_i44.AddCourseUsecase>(
        () => _i44.AddCourseUsecase(gh<_i14.CourseRepository>()));
    gh.lazySingleton<_i45.AddEducationUsecase>(
        () => _i45.AddEducationUsecase(gh<_i42.AccountRepository>()));
    gh.lazySingleton<_i46.AddExperienceUsecase>(
        () => _i46.AddExperienceUsecase(gh<_i42.AccountRepository>()));
    gh.lazySingleton<_i47.AddFavoriteUsecase>(
        () => _i47.AddFavoriteUsecase(gh<_i17.FavoriteRepository>()));
    gh.lazySingleton<_i48.AppRemoteDatasource>(
        () => _i48.AppRemoteDatasourceImpl(
              gh<_i11.AuthService>(),
              gh<_i12.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i49.AppRepository>(
        () => _i50.AppRepositoryImpl(gh<_i48.AppRemoteDatasource>()));
    gh.lazySingleton<_i51.DeleteEducatonUsecase>(
        () => _i51.DeleteEducatonUsecase(gh<_i42.AccountRepository>()));
    gh.lazySingleton<_i52.DeleteExperienceUsecase>(
        () => _i52.DeleteExperienceUsecase(gh<_i42.AccountRepository>()));
    gh.lazySingleton<_i53.GetCreatedCourse>(
        () => _i53.GetCreatedCourse(gh<_i26.MyCourseRepository>()));
    gh.lazySingleton<_i54.GetCurrentUserAuthUsecase>(
        () => _i54.GetCurrentUserAuthUsecase(gh<_i49.AppRepository>()));
    gh.lazySingleton<_i55.GetCurrentUserDataUsecase>(
        () => _i55.GetCurrentUserDataUsecase(gh<_i23.HomeRepository>()));
    gh.lazySingleton<_i56.GetCurrentUserUsecase>(
        () => _i56.GetCurrentUserUsecase(gh<_i42.AccountRepository>()));
    gh.lazySingleton<_i57.GetProfileUsecase>(
        () => _i57.GetProfileUsecase(gh<_i42.AccountRepository>()));
    gh.lazySingleton<_i58.GetRegisteredCourseUsecase>(
        () => _i58.GetRegisteredCourseUsecase(gh<_i26.MyCourseRepository>()));
    gh.lazySingleton<_i59.GetUserUsecase>(
        () => _i59.GetUserUsecase(gh<_i49.AppRepository>()));
    gh.factory<_i60.HomeCubit>(
        () => _i60.HomeCubit(gh<_i55.GetCurrentUserDataUsecase>()));
    gh.factory<_i61.MyCourseCubit>(() => _i61.MyCourseCubit(
          gh<_i58.GetRegisteredCourseUsecase>(),
          gh<_i55.GetCurrentUserDataUsecase>(),
          gh<_i53.GetCreatedCourse>(),
        ));
    gh.lazySingleton<_i62.SaveUserDataUsecase>(
        () => _i62.SaveUserDataUsecase(gh<_i49.AppRepository>()));
    gh.lazySingleton<_i63.SettingLocalDatasource>(() =>
        _i63.SettingLocalDatasourceImpl(gh<_i31.SharedPreferenceService>()));
    gh.lazySingleton<_i64.SettingRepository>(() => _i65.SettingRepositoryImpl(
          gh<_i30.SettingRemoteDatasource>(),
          gh<_i63.SettingLocalDatasource>(),
        ));
    gh.factory<_i66.SignInCubit>(() => _i66.SignInCubit(
          gh<_i35.SignInUsecase>(),
          gh<_i59.GetUserUsecase>(),
        ));
    gh.lazySingleton<_i67.SignInWithGoogleUsecase>(
        () => _i67.SignInWithGoogleUsecase(gh<_i49.AppRepository>()));
    gh.lazySingleton<_i68.SignOutUsecase>(
        () => _i68.SignOutUsecase(gh<_i64.SettingRepository>()));
    gh.factory<_i69.SignUpCubit>(() => _i69.SignUpCubit(
          gh<_i39.SignUpUsecase>(),
          gh<_i40.UpdateUserRoleUsecase>(),
        ));
    gh.lazySingleton<_i70.UpdateEducationUsecase>(
        () => _i70.UpdateEducationUsecase(gh<_i42.AccountRepository>()));
    gh.lazySingleton<_i71.UpdateExperienceUsecase>(
        () => _i71.UpdateExperienceUsecase(gh<_i42.AccountRepository>()));
    gh.lazySingleton<_i72.UpdateUserProfile>(
        () => _i72.UpdateUserProfile(gh<_i42.AccountRepository>()));
    gh.lazySingleton<_i73.UploadImageUsecase>(
        () => _i73.UploadImageUsecase(gh<_i42.AccountRepository>()));
    gh.factory<_i74.AccountCubit>(() => _i74.AccountCubit(
          gh<_i56.GetCurrentUserUsecase>(),
          gh<_i6.ImagePicker>(),
          gh<_i73.UploadImageUsecase>(),
          gh<_i72.UpdateUserProfile>(),
          gh<_i46.AddExperienceUsecase>(),
          gh<_i52.DeleteExperienceUsecase>(),
          gh<_i71.UpdateExperienceUsecase>(),
          gh<_i45.AddEducationUsecase>(),
          gh<_i51.DeleteEducatonUsecase>(),
          gh<_i70.UpdateEducationUsecase>(),
          gh<_i57.GetProfileUsecase>(),
        ));
    gh.factory<_i75.AppCubit>(() => _i75.AppCubit(
          gh<_i54.GetCurrentUserAuthUsecase>(),
          gh<_i59.GetUserUsecase>(),
          gh<_i67.SignInWithGoogleUsecase>(),
          gh<_i62.SaveUserDataUsecase>(),
        ));
    gh.factory<_i76.CourseCubit>(() => _i76.CourseCubit(
          gh<_i55.GetCurrentUserDataUsecase>(),
          gh<_i44.AddCourseUsecase>(),
          gh<_i19.GetAllCourseUsecase>(),
          gh<_i20.GetCategoriesUsecase>(),
          gh<_i28.RegisterUsecase>(),
          gh<_i58.GetRegisteredCourseUsecase>(),
          gh<_i6.ImagePicker>(),
          gh<_i73.UploadImageUsecase>(),
          gh<_i47.AddFavoriteUsecase>(),
          gh<_i21.GetFavoriteUsecase>(),
          gh<_i29.RemoveFavoriteUsecase>(),
        ));
    gh.factory<_i77.FavoriteCubit>(() => _i77.FavoriteCubit(
          gh<_i21.GetFavoriteUsecase>(),
          gh<_i55.GetCurrentUserDataUsecase>(),
        ));
    gh.lazySingleton<_i78.GetLanguageUsecase>(
        () => _i78.GetLanguageUsecase(gh<_i64.SettingRepository>()));
    gh.lazySingleton<_i79.SetLanguageUsecase>(
        () => _i79.SetLanguageUsecase(gh<_i64.SettingRepository>()));
    gh.factory<_i80.SettingCubit>(() => _i80.SettingCubit(
          gh<_i68.SignOutUsecase>(),
          gh<_i78.GetLanguageUsecase>(),
          gh<_i79.SetLanguageUsecase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i81.InjectionModule {}
