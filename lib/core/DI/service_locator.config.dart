// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_storage/firebase_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i8;
import 'package:logger/logger.dart' as _i9;
import 'package:shared_preferences/shared_preferences.dart' as _i10;
import 'package:tutors/core/DI/register_modules.dart' as _i84;
import 'package:tutors/core/services/auth_service.dart' as _i12;
import 'package:tutors/core/services/cloud_firestore_service.dart' as _i13;
import 'package:tutors/core/services/shared_preference_service.dart' as _i32;
import 'package:tutors/core/services/storage_service.dart' as _i11;
import 'package:tutors/features/account/data/datasources/account_remote_datasource.dart'
    as _i42;
import 'package:tutors/features/account/data/repositories/account_repository_impl.dart'
    as _i44;
import 'package:tutors/features/account/domain/repositories/account_repository.dart'
    as _i43;
import 'package:tutors/features/account/domain/usecases/add_education_usecase.dart'
    as _i46;
import 'package:tutors/features/account/domain/usecases/add_experience_usecase.dart'
    as _i47;
import 'package:tutors/features/account/domain/usecases/delete_education_usecase.dart'
    as _i52;
import 'package:tutors/features/account/domain/usecases/delete_experience_usecase.dart'
    as _i53;
import 'package:tutors/features/account/domain/usecases/get_current_user_usecase.dart'
    as _i58;
import 'package:tutors/features/account/domain/usecases/get_profile_usecase.dart'
    as _i59;
import 'package:tutors/features/account/domain/usecases/update_education_usecase.dart'
    as _i73;
import 'package:tutors/features/account/domain/usecases/update_experience_usecase.dart'
    as _i74;
import 'package:tutors/features/account/domain/usecases/update_user_profile.dart'
    as _i75;
import 'package:tutors/features/account/domain/usecases/upload_image_usecase.dart'
    as _i76;
import 'package:tutors/features/account/presentation/cubit/account_cubit.dart'
    as _i77;
import 'package:tutors/features/app/data/datasources/app_remote_datasource.dart'
    as _i49;
import 'package:tutors/features/app/data/repositories/app_repository_impl.dart'
    as _i51;
import 'package:tutors/features/app/domain/repository/app_repository.dart'
    as _i50;
import 'package:tutors/features/app/domain/usecases/get_current_user_auth_usecase.dart'
    as _i56;
import 'package:tutors/features/app/domain/usecases/get_user_usecase.dart'
    as _i62;
import 'package:tutors/features/app/domain/usecases/save_user_data_usecase.dart'
    as _i65;
import 'package:tutors/features/app/domain/usecases/sign_in_google_usecase.dart'
    as _i70;
import 'package:tutors/features/app/presentation/cubit/app_cubit.dart' as _i78;
import 'package:tutors/features/chat/presentation/cubit/chat_cubit.dart' as _i3;
import 'package:tutors/features/courses/data/datasources/course_remote_datasource.dart'
    as _i14;
import 'package:tutors/features/courses/data/repositories/course_repository_impl.dart'
    as _i16;
import 'package:tutors/features/courses/domain/repositories/course_repository.dart'
    as _i15;
import 'package:tutors/features/courses/domain/usecases/add_course_usecase.dart'
    as _i45;
import 'package:tutors/features/courses/domain/usecases/get_all_course_usecase.dart'
    as _i20;
import 'package:tutors/features/courses/domain/usecases/get_categories_usecase.dart'
    as _i21;
import 'package:tutors/features/courses/domain/usecases/register_usecase.dart'
    as _i29;
import 'package:tutors/features/courses/presentation/cubit/course_cubit.dart'
    as _i79;
import 'package:tutors/features/favorites/data/datasources/favorite_remote_datasource.dart'
    as _i17;
import 'package:tutors/features/favorites/data/repositories/favorite_repository_impl.dart'
    as _i19;
import 'package:tutors/features/favorites/domain/repositories/favorite_repository.dart'
    as _i18;
import 'package:tutors/features/favorites/domain/usecases/add_favorite_usecase.dart'
    as _i48;
import 'package:tutors/features/favorites/domain/usecases/get_favorite_usecase.dart'
    as _i22;
import 'package:tutors/features/favorites/domain/usecases/remove_favorite_usecase.dart'
    as _i30;
import 'package:tutors/features/favorites/presentation/cubit/favorite_cubit.dart'
    as _i80;
import 'package:tutors/features/home/data/datasources/home_remote_datasource.dart'
    as _i23;
import 'package:tutors/features/home/data/repositories/home_ropository_impl.dart'
    as _i25;
import 'package:tutors/features/home/domain/repositories/home_repository.dart'
    as _i24;
import 'package:tutors/features/home/domain/usecases/get_current_user_usecase.dart'
    as _i57;
import 'package:tutors/features/home/presentation/cubit/home_cubit.dart'
    as _i63;
import 'package:tutors/features/my_courses/data/datasources/my_course_remote_datasource.dart'
    as _i26;
import 'package:tutors/features/my_courses/data/repositories/my_course_repository_impl.dart'
    as _i28;
import 'package:tutors/features/my_courses/domain/repositories/my_course_repository.dart'
    as _i27;
import 'package:tutors/features/my_courses/domain/usecases/get_course_detail_usecase.dart'
    as _i54;
import 'package:tutors/features/my_courses/domain/usecases/get_created_course_usecase.dart'
    as _i55;
import 'package:tutors/features/my_courses/domain/usecases/get_register_by_course_usecase.dart'
    as _i60;
import 'package:tutors/features/my_courses/domain/usecases/get_registered_course_usecase.dart'
    as _i61;
import 'package:tutors/features/my_courses/presentation/cubit/my_course_cubit.dart'
    as _i64;
import 'package:tutors/features/settings/data/datasources/setting_local_datasource.dart'
    as _i66;
import 'package:tutors/features/settings/data/datasources/setting_remote_datasource.dart'
    as _i31;
import 'package:tutors/features/settings/data/repositories/setting_repository_impl.dart'
    as _i68;
import 'package:tutors/features/settings/domain/repositories/setting_repository.dart'
    as _i67;
import 'package:tutors/features/settings/domain/usecases/get_language_usecase.dart'
    as _i81;
import 'package:tutors/features/settings/domain/usecases/set_language_usecase.dart'
    as _i82;
import 'package:tutors/features/settings/domain/usecases/sign_out_usecase.dart'
    as _i71;
import 'package:tutors/features/settings/presentation/cubit/setting_cubit.dart'
    as _i83;
import 'package:tutors/features/sign_in/data/datasources/sign_in_remote_datasorece.dart'
    as _i33;
import 'package:tutors/features/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i35;
import 'package:tutors/features/sign_in/domain/repositories/sign_in_repository.dart'
    as _i34;
import 'package:tutors/features/sign_in/domain/usecases/sign_in_usecase.dart'
    as _i36;
import 'package:tutors/features/sign_in/presentation/cubit/sign_in_cubit.dart'
    as _i69;
import 'package:tutors/features/sign_up/data/datasources/sign_up_remote_datasorece.dart'
    as _i37;
import 'package:tutors/features/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i39;
import 'package:tutors/features/sign_up/domain/repositories/sign_up_repository.dart'
    as _i38;
import 'package:tutors/features/sign_up/domain/usecases/sign_up_usecase.dart'
    as _i40;
import 'package:tutors/features/sign_up/domain/usecases/update_user_role_usecase.dart'
    as _i41;
import 'package:tutors/features/sign_up/presentation/cubit/sign_up_cubit.dart'
    as _i72;

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
    gh.factory<_i3.ChatCubit>(() => _i3.ChatCubit());
    gh.lazySingleton<_i4.FirebaseAuth>(() => injectionModule.auth);
    gh.lazySingleton<_i5.FirebaseFirestore>(() => injectionModule.firestore);
    gh.lazySingleton<_i6.FirebaseStorage>(() => injectionModule.storage);
    gh.lazySingleton<_i7.ImagePicker>(() => injectionModule.picker);
    gh.factory<_i8.InternetConnectionChecker>(
        () => injectionModule.internetChecker);
    gh.factory<_i9.Logger>(() => injectionModule.logger);
    await gh.factoryAsync<_i10.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i11.StorageService>(
        () => _i11.StorageServiceImpl(gh<_i6.FirebaseStorage>()));
    gh.singleton<_i12.AuthService>(_i12.AuthService(gh<_i4.FirebaseAuth>()));
    gh.lazySingleton<_i13.CouldFireStoreService>(
        () => _i13.CouldFireStoreService(gh<_i5.FirebaseFirestore>()));
    gh.lazySingleton<_i14.CourseRemoteDatasource>(() =>
        _i14.CourseRemoteDatasourceImpl(gh<_i13.CouldFireStoreService>()));
    gh.lazySingleton<_i15.CourseRepository>(
        () => _i16.CourseRepositoryImpl(gh<_i14.CourseRemoteDatasource>()));
    gh.lazySingleton<_i17.FavoriteRemoteDatasource>(() =>
        _i17.FavoriteRemoteDatasourceImpl(gh<_i13.CouldFireStoreService>()));
    gh.lazySingleton<_i18.FavoriteRepository>(
        () => _i19.FavoriteRepositoryImpl(gh<_i17.FavoriteRemoteDatasource>()));
    gh.lazySingleton<_i20.GetAllCourseUsecase>(
        () => _i20.GetAllCourseUsecase(gh<_i15.CourseRepository>()));
    gh.lazySingleton<_i21.GetCategoriesUsecase>(
        () => _i21.GetCategoriesUsecase(gh<_i15.CourseRepository>()));
    gh.lazySingleton<_i22.GetFavoriteUsecase>(
        () => _i22.GetFavoriteUsecase(gh<_i18.FavoriteRepository>()));
    gh.lazySingleton<_i23.HomeRemoteDatasource>(
        () => _i23.HomeRemoteDatasourceImpl(
              gh<_i12.AuthService>(),
              gh<_i13.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i24.HomeRepository>(
        () => _i25.HomeRepositoryImpl(gh<_i23.HomeRemoteDatasource>()));
    gh.lazySingleton<_i26.MyCourseRemoteDatasource>(
        () => _i26.MyCourseRemoteDatasourceImpl(
              gh<_i13.CouldFireStoreService>(),
              gh<_i12.AuthService>(),
            ));
    gh.lazySingleton<_i27.MyCourseRepository>(
        () => _i28.MyCourseRepositoryImpl(gh<_i26.MyCourseRemoteDatasource>()));
    gh.lazySingleton<_i29.RegisterUsecase>(
        () => _i29.RegisterUsecase(gh<_i15.CourseRepository>()));
    gh.lazySingleton<_i30.RemoveFavoriteUsecase>(
        () => _i30.RemoveFavoriteUsecase(gh<_i18.FavoriteRepository>()));
    gh.lazySingleton<_i31.SettingRemoteDatasource>(
        () => _i31.SettingRemoteDatasourceImpl(gh<_i12.AuthService>()));
    gh.lazySingleton<_i32.SharedPreferenceService>(
        () => _i32.SharedPreferenceServiceImpl(gh<_i10.SharedPreferences>()));
    gh.lazySingleton<_i33.SignInRemoteDatasource>(
        () => _i33.SignInRemoteDatasourceImpl(gh<_i12.AuthService>()));
    gh.lazySingleton<_i34.SignInRepository>(
        () => _i35.SignInRepositoryImpl(gh<_i33.SignInRemoteDatasource>()));
    gh.lazySingleton<_i36.SignInUsecase>(
        () => _i36.SignInUsecase(gh<_i34.SignInRepository>()));
    gh.lazySingleton<_i37.SignUpRemoteDatasource>(
        () => _i37.SignUpRemoteDatasourceImpl(
              gh<_i12.AuthService>(),
              gh<_i13.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i38.SignUpRepository>(
        () => _i39.SignUpRepositoryImpl(gh<_i37.SignUpRemoteDatasource>()));
    gh.lazySingleton<_i40.SignUpUsecase>(
        () => _i40.SignUpUsecase(gh<_i38.SignUpRepository>()));
    gh.lazySingleton<_i41.UpdateUserRoleUsecase>(
        () => _i41.UpdateUserRoleUsecase(gh<_i38.SignUpRepository>()));
    gh.lazySingleton<_i42.AccountRemoteDatasource>(
        () => _i42.AccountRemoteDatasourceImpl(
              gh<_i12.AuthService>(),
              gh<_i13.CouldFireStoreService>(),
              gh<_i11.StorageService>(),
            ));
    gh.lazySingleton<_i43.AccountRepository>(
        () => _i44.AccountRepositoryImpl(gh<_i42.AccountRemoteDatasource>()));
    gh.lazySingleton<_i45.AddCourseUsecase>(
        () => _i45.AddCourseUsecase(gh<_i15.CourseRepository>()));
    gh.lazySingleton<_i46.AddEducationUsecase>(
        () => _i46.AddEducationUsecase(gh<_i43.AccountRepository>()));
    gh.lazySingleton<_i47.AddExperienceUsecase>(
        () => _i47.AddExperienceUsecase(gh<_i43.AccountRepository>()));
    gh.lazySingleton<_i48.AddFavoriteUsecase>(
        () => _i48.AddFavoriteUsecase(gh<_i18.FavoriteRepository>()));
    gh.lazySingleton<_i49.AppRemoteDatasource>(
        () => _i49.AppRemoteDatasourceImpl(
              gh<_i12.AuthService>(),
              gh<_i13.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i50.AppRepository>(
        () => _i51.AppRepositoryImpl(gh<_i49.AppRemoteDatasource>()));
    gh.lazySingleton<_i52.DeleteEducatonUsecase>(
        () => _i52.DeleteEducatonUsecase(gh<_i43.AccountRepository>()));
    gh.lazySingleton<_i53.DeleteExperienceUsecase>(
        () => _i53.DeleteExperienceUsecase(gh<_i43.AccountRepository>()));
    gh.lazySingleton<_i54.GetCourseDetailUsecase>(
        () => _i54.GetCourseDetailUsecase(gh<_i27.MyCourseRepository>()));
    gh.lazySingleton<_i55.GetCreatedCourse>(
        () => _i55.GetCreatedCourse(gh<_i27.MyCourseRepository>()));
    gh.lazySingleton<_i56.GetCurrentUserAuthUsecase>(
        () => _i56.GetCurrentUserAuthUsecase(gh<_i50.AppRepository>()));
    gh.lazySingleton<_i57.GetCurrentUserDataUsecase>(
        () => _i57.GetCurrentUserDataUsecase(gh<_i24.HomeRepository>()));
    gh.lazySingleton<_i58.GetCurrentUserUsecase>(
        () => _i58.GetCurrentUserUsecase(gh<_i43.AccountRepository>()));
    gh.lazySingleton<_i59.GetProfileUsecase>(
        () => _i59.GetProfileUsecase(gh<_i43.AccountRepository>()));
    gh.lazySingleton<_i60.GetRegisterbyCourseUsecase>(
        () => _i60.GetRegisterbyCourseUsecase(gh<_i27.MyCourseRepository>()));
    gh.lazySingleton<_i61.GetRegisteredCourseUsecase>(
        () => _i61.GetRegisteredCourseUsecase(gh<_i27.MyCourseRepository>()));
    gh.lazySingleton<_i62.GetUserUsecase>(
        () => _i62.GetUserUsecase(gh<_i50.AppRepository>()));
    gh.factory<_i63.HomeCubit>(
        () => _i63.HomeCubit(gh<_i57.GetCurrentUserDataUsecase>()));
    gh.factory<_i64.MyCourseCubit>(() => _i64.MyCourseCubit(
          gh<_i61.GetRegisteredCourseUsecase>(),
          gh<_i57.GetCurrentUserDataUsecase>(),
          gh<_i55.GetCreatedCourse>(),
          gh<_i54.GetCourseDetailUsecase>(),
          gh<_i60.GetRegisterbyCourseUsecase>(),
        ));
    gh.lazySingleton<_i65.SaveUserDataUsecase>(
        () => _i65.SaveUserDataUsecase(gh<_i50.AppRepository>()));
    gh.lazySingleton<_i66.SettingLocalDatasource>(() =>
        _i66.SettingLocalDatasourceImpl(gh<_i32.SharedPreferenceService>()));
    gh.lazySingleton<_i67.SettingRepository>(() => _i68.SettingRepositoryImpl(
          gh<_i31.SettingRemoteDatasource>(),
          gh<_i66.SettingLocalDatasource>(),
        ));
    gh.factory<_i69.SignInCubit>(() => _i69.SignInCubit(
          gh<_i36.SignInUsecase>(),
          gh<_i62.GetUserUsecase>(),
        ));
    gh.lazySingleton<_i70.SignInWithGoogleUsecase>(
        () => _i70.SignInWithGoogleUsecase(gh<_i50.AppRepository>()));
    gh.lazySingleton<_i71.SignOutUsecase>(
        () => _i71.SignOutUsecase(gh<_i67.SettingRepository>()));
    gh.factory<_i72.SignUpCubit>(() => _i72.SignUpCubit(
          gh<_i40.SignUpUsecase>(),
          gh<_i41.UpdateUserRoleUsecase>(),
        ));
    gh.lazySingleton<_i73.UpdateEducationUsecase>(
        () => _i73.UpdateEducationUsecase(gh<_i43.AccountRepository>()));
    gh.lazySingleton<_i74.UpdateExperienceUsecase>(
        () => _i74.UpdateExperienceUsecase(gh<_i43.AccountRepository>()));
    gh.lazySingleton<_i75.UpdateUserProfile>(
        () => _i75.UpdateUserProfile(gh<_i43.AccountRepository>()));
    gh.lazySingleton<_i76.UploadImageUsecase>(
        () => _i76.UploadImageUsecase(gh<_i43.AccountRepository>()));
    gh.factory<_i77.AccountCubit>(() => _i77.AccountCubit(
          gh<_i58.GetCurrentUserUsecase>(),
          gh<_i7.ImagePicker>(),
          gh<_i76.UploadImageUsecase>(),
          gh<_i75.UpdateUserProfile>(),
          gh<_i47.AddExperienceUsecase>(),
          gh<_i53.DeleteExperienceUsecase>(),
          gh<_i74.UpdateExperienceUsecase>(),
          gh<_i46.AddEducationUsecase>(),
          gh<_i52.DeleteEducatonUsecase>(),
          gh<_i73.UpdateEducationUsecase>(),
          gh<_i59.GetProfileUsecase>(),
        ));
    gh.factory<_i78.AppCubit>(() => _i78.AppCubit(
          gh<_i56.GetCurrentUserAuthUsecase>(),
          gh<_i62.GetUserUsecase>(),
          gh<_i70.SignInWithGoogleUsecase>(),
          gh<_i65.SaveUserDataUsecase>(),
        ));
    gh.factory<_i79.CourseCubit>(() => _i79.CourseCubit(
          gh<_i57.GetCurrentUserDataUsecase>(),
          gh<_i45.AddCourseUsecase>(),
          gh<_i20.GetAllCourseUsecase>(),
          gh<_i21.GetCategoriesUsecase>(),
          gh<_i29.RegisterUsecase>(),
          gh<_i61.GetRegisteredCourseUsecase>(),
          gh<_i7.ImagePicker>(),
          gh<_i76.UploadImageUsecase>(),
          gh<_i48.AddFavoriteUsecase>(),
          gh<_i22.GetFavoriteUsecase>(),
          gh<_i30.RemoveFavoriteUsecase>(),
        ));
    gh.factory<_i80.FavoriteCubit>(() => _i80.FavoriteCubit(
          gh<_i22.GetFavoriteUsecase>(),
          gh<_i57.GetCurrentUserDataUsecase>(),
        ));
    gh.lazySingleton<_i81.GetLanguageUsecase>(
        () => _i81.GetLanguageUsecase(gh<_i67.SettingRepository>()));
    gh.lazySingleton<_i82.SetLanguageUsecase>(
        () => _i82.SetLanguageUsecase(gh<_i67.SettingRepository>()));
    gh.factory<_i83.SettingCubit>(() => _i83.SettingCubit(
          gh<_i71.SignOutUsecase>(),
          gh<_i81.GetLanguageUsecase>(),
          gh<_i82.SetLanguageUsecase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i84.InjectionModule {}
