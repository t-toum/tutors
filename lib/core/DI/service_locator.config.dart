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
import 'package:tutors/core/DI/register_modules.dart' as _i87;
import 'package:tutors/core/services/auth_service.dart' as _i12;
import 'package:tutors/core/services/cloud_firestore_service.dart' as _i13;
import 'package:tutors/core/services/shared_preference_service.dart' as _i32;
import 'package:tutors/core/services/storage_service.dart' as _i11;
import 'package:tutors/features/account/data/datasources/account_remote_datasource.dart'
    as _i44;
import 'package:tutors/features/account/data/repositories/account_repository_impl.dart'
    as _i46;
import 'package:tutors/features/account/domain/repositories/account_repository.dart'
    as _i45;
import 'package:tutors/features/account/domain/usecases/add_education_usecase.dart'
    as _i48;
import 'package:tutors/features/account/domain/usecases/add_experience_usecase.dart'
    as _i49;
import 'package:tutors/features/account/domain/usecases/delete_education_usecase.dart'
    as _i55;
import 'package:tutors/features/account/domain/usecases/delete_experience_usecase.dart'
    as _i56;
import 'package:tutors/features/account/domain/usecases/get_current_user_usecase.dart'
    as _i61;
import 'package:tutors/features/account/domain/usecases/get_profile_usecase.dart'
    as _i62;
import 'package:tutors/features/account/domain/usecases/update_education_usecase.dart'
    as _i76;
import 'package:tutors/features/account/domain/usecases/update_experience_usecase.dart'
    as _i77;
import 'package:tutors/features/account/domain/usecases/update_user_profile.dart'
    as _i78;
import 'package:tutors/features/account/domain/usecases/upload_image_usecase.dart'
    as _i79;
import 'package:tutors/features/account/presentation/cubit/account_cubit.dart'
    as _i80;
import 'package:tutors/features/app/data/datasources/app_remote_datasource.dart'
    as _i51;
import 'package:tutors/features/app/data/repositories/app_repository_impl.dart'
    as _i53;
import 'package:tutors/features/app/domain/repository/app_repository.dart'
    as _i52;
import 'package:tutors/features/app/domain/usecases/get_current_user_auth_usecase.dart'
    as _i59;
import 'package:tutors/features/app/domain/usecases/get_user_usecase.dart'
    as _i65;
import 'package:tutors/features/app/domain/usecases/save_user_data_usecase.dart'
    as _i68;
import 'package:tutors/features/app/domain/usecases/sign_in_google_usecase.dart'
    as _i73;
import 'package:tutors/features/app/presentation/cubit/app_cubit.dart' as _i81;
import 'package:tutors/features/chat/presentation/cubit/chat_cubit.dart' as _i3;
import 'package:tutors/features/courses/data/datasources/course_remote_datasource.dart'
    as _i14;
import 'package:tutors/features/courses/data/repositories/course_repository_impl.dart'
    as _i16;
import 'package:tutors/features/courses/domain/repositories/course_repository.dart'
    as _i15;
import 'package:tutors/features/courses/domain/usecases/add_course_usecase.dart'
    as _i47;
import 'package:tutors/features/courses/domain/usecases/get_all_course_usecase.dart'
    as _i20;
import 'package:tutors/features/courses/domain/usecases/get_categories_usecase.dart'
    as _i21;
import 'package:tutors/features/courses/domain/usecases/register_usecase.dart'
    as _i29;
import 'package:tutors/features/courses/domain/usecases/update_course_usecase.dart'
    as _i42;
import 'package:tutors/features/courses/presentation/cubit/course_cubit.dart'
    as _i82;
import 'package:tutors/features/favorites/data/datasources/favorite_remote_datasource.dart'
    as _i17;
import 'package:tutors/features/favorites/data/repositories/favorite_repository_impl.dart'
    as _i19;
import 'package:tutors/features/favorites/domain/repositories/favorite_repository.dart'
    as _i18;
import 'package:tutors/features/favorites/domain/usecases/add_favorite_usecase.dart'
    as _i50;
import 'package:tutors/features/favorites/domain/usecases/get_favorite_usecase.dart'
    as _i22;
import 'package:tutors/features/favorites/domain/usecases/remove_favorite_usecase.dart'
    as _i30;
import 'package:tutors/features/favorites/presentation/cubit/favorite_cubit.dart'
    as _i83;
import 'package:tutors/features/home/data/datasources/home_remote_datasource.dart'
    as _i23;
import 'package:tutors/features/home/data/repositories/home_ropository_impl.dart'
    as _i25;
import 'package:tutors/features/home/domain/repositories/home_repository.dart'
    as _i24;
import 'package:tutors/features/home/domain/usecases/get_current_user_usecase.dart'
    as _i60;
import 'package:tutors/features/home/presentation/cubit/home_cubit.dart'
    as _i66;
import 'package:tutors/features/my_courses/data/datasources/my_course_remote_datasource.dart'
    as _i26;
import 'package:tutors/features/my_courses/data/repositories/my_course_repository_impl.dart'
    as _i28;
import 'package:tutors/features/my_courses/domain/repositories/my_course_repository.dart'
    as _i27;
import 'package:tutors/features/my_courses/domain/usecases/delete_course_usecase.dart'
    as _i54;
import 'package:tutors/features/my_courses/domain/usecases/get_course_detail_usecase.dart'
    as _i57;
import 'package:tutors/features/my_courses/domain/usecases/get_created_course_usecase.dart'
    as _i58;
import 'package:tutors/features/my_courses/domain/usecases/get_register_by_course_usecase.dart'
    as _i63;
import 'package:tutors/features/my_courses/domain/usecases/get_registered_course_usecase.dart'
    as _i64;
import 'package:tutors/features/my_courses/domain/usecases/update_course_status_usecase.dart'
    as _i41;
import 'package:tutors/features/my_courses/presentation/cubit/my_course_cubit.dart'
    as _i67;
import 'package:tutors/features/settings/data/datasources/setting_local_datasource.dart'
    as _i69;
import 'package:tutors/features/settings/data/datasources/setting_remote_datasource.dart'
    as _i31;
import 'package:tutors/features/settings/data/repositories/setting_repository_impl.dart'
    as _i71;
import 'package:tutors/features/settings/domain/repositories/setting_repository.dart'
    as _i70;
import 'package:tutors/features/settings/domain/usecases/get_language_usecase.dart'
    as _i84;
import 'package:tutors/features/settings/domain/usecases/set_language_usecase.dart'
    as _i85;
import 'package:tutors/features/settings/domain/usecases/sign_out_usecase.dart'
    as _i74;
import 'package:tutors/features/settings/presentation/cubit/setting_cubit.dart'
    as _i86;
import 'package:tutors/features/sign_in/data/datasources/sign_in_remote_datasorece.dart'
    as _i33;
import 'package:tutors/features/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i35;
import 'package:tutors/features/sign_in/domain/repositories/sign_in_repository.dart'
    as _i34;
import 'package:tutors/features/sign_in/domain/usecases/sign_in_usecase.dart'
    as _i36;
import 'package:tutors/features/sign_in/presentation/cubit/sign_in_cubit.dart'
    as _i72;
import 'package:tutors/features/sign_up/data/datasources/sign_up_remote_datasorece.dart'
    as _i37;
import 'package:tutors/features/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i39;
import 'package:tutors/features/sign_up/domain/repositories/sign_up_repository.dart'
    as _i38;
import 'package:tutors/features/sign_up/domain/usecases/sign_up_usecase.dart'
    as _i40;
import 'package:tutors/features/sign_up/domain/usecases/update_user_role_usecase.dart'
    as _i43;
import 'package:tutors/features/sign_up/presentation/cubit/sign_up_cubit.dart'
    as _i75;

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
    gh.lazySingleton<_i41.UpdateCourseStatusUsecase>(
        () => _i41.UpdateCourseStatusUsecase(gh<_i27.MyCourseRepository>()));
    gh.lazySingleton<_i42.UpdateCourseUsecase>(
        () => _i42.UpdateCourseUsecase(gh<_i15.CourseRepository>()));
    gh.lazySingleton<_i43.UpdateUserRoleUsecase>(
        () => _i43.UpdateUserRoleUsecase(gh<_i38.SignUpRepository>()));
    gh.lazySingleton<_i44.AccountRemoteDatasource>(
        () => _i44.AccountRemoteDatasourceImpl(
              gh<_i12.AuthService>(),
              gh<_i13.CouldFireStoreService>(),
              gh<_i11.StorageService>(),
            ));
    gh.lazySingleton<_i45.AccountRepository>(
        () => _i46.AccountRepositoryImpl(gh<_i44.AccountRemoteDatasource>()));
    gh.lazySingleton<_i47.AddCourseUsecase>(
        () => _i47.AddCourseUsecase(gh<_i15.CourseRepository>()));
    gh.lazySingleton<_i48.AddEducationUsecase>(
        () => _i48.AddEducationUsecase(gh<_i45.AccountRepository>()));
    gh.lazySingleton<_i49.AddExperienceUsecase>(
        () => _i49.AddExperienceUsecase(gh<_i45.AccountRepository>()));
    gh.lazySingleton<_i50.AddFavoriteUsecase>(
        () => _i50.AddFavoriteUsecase(gh<_i18.FavoriteRepository>()));
    gh.lazySingleton<_i51.AppRemoteDatasource>(
        () => _i51.AppRemoteDatasourceImpl(
              gh<_i12.AuthService>(),
              gh<_i13.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i52.AppRepository>(
        () => _i53.AppRepositoryImpl(gh<_i51.AppRemoteDatasource>()));
    gh.lazySingleton<_i54.DeleteCourseUsecase>(
        () => _i54.DeleteCourseUsecase(gh<_i27.MyCourseRepository>()));
    gh.lazySingleton<_i55.DeleteEducatonUsecase>(
        () => _i55.DeleteEducatonUsecase(gh<_i45.AccountRepository>()));
    gh.lazySingleton<_i56.DeleteExperienceUsecase>(
        () => _i56.DeleteExperienceUsecase(gh<_i45.AccountRepository>()));
    gh.lazySingleton<_i57.GetCourseDetailUsecase>(
        () => _i57.GetCourseDetailUsecase(gh<_i27.MyCourseRepository>()));
    gh.lazySingleton<_i58.GetCreatedCourse>(
        () => _i58.GetCreatedCourse(gh<_i27.MyCourseRepository>()));
    gh.lazySingleton<_i59.GetCurrentUserAuthUsecase>(
        () => _i59.GetCurrentUserAuthUsecase(gh<_i52.AppRepository>()));
    gh.lazySingleton<_i60.GetCurrentUserDataUsecase>(
        () => _i60.GetCurrentUserDataUsecase(gh<_i24.HomeRepository>()));
    gh.lazySingleton<_i61.GetCurrentUserUsecase>(
        () => _i61.GetCurrentUserUsecase(gh<_i45.AccountRepository>()));
    gh.lazySingleton<_i62.GetProfileUsecase>(
        () => _i62.GetProfileUsecase(gh<_i45.AccountRepository>()));
    gh.lazySingleton<_i63.GetRegisterbyCourseUsecase>(
        () => _i63.GetRegisterbyCourseUsecase(gh<_i27.MyCourseRepository>()));
    gh.lazySingleton<_i64.GetRegisteredCourseUsecase>(
        () => _i64.GetRegisteredCourseUsecase(gh<_i27.MyCourseRepository>()));
    gh.lazySingleton<_i65.GetUserUsecase>(
        () => _i65.GetUserUsecase(gh<_i52.AppRepository>()));
    gh.factory<_i66.HomeCubit>(
        () => _i66.HomeCubit(gh<_i60.GetCurrentUserDataUsecase>()));
    gh.factory<_i67.MyCourseCubit>(() => _i67.MyCourseCubit(
          gh<_i64.GetRegisteredCourseUsecase>(),
          gh<_i60.GetCurrentUserDataUsecase>(),
          gh<_i58.GetCreatedCourse>(),
          gh<_i57.GetCourseDetailUsecase>(),
          gh<_i63.GetRegisterbyCourseUsecase>(),
          gh<_i41.UpdateCourseStatusUsecase>(),
          gh<_i54.DeleteCourseUsecase>(),
        ));
    gh.lazySingleton<_i68.SaveUserDataUsecase>(
        () => _i68.SaveUserDataUsecase(gh<_i52.AppRepository>()));
    gh.lazySingleton<_i69.SettingLocalDatasource>(() =>
        _i69.SettingLocalDatasourceImpl(gh<_i32.SharedPreferenceService>()));
    gh.lazySingleton<_i70.SettingRepository>(() => _i71.SettingRepositoryImpl(
          gh<_i31.SettingRemoteDatasource>(),
          gh<_i69.SettingLocalDatasource>(),
        ));
    gh.factory<_i72.SignInCubit>(() => _i72.SignInCubit(
          gh<_i36.SignInUsecase>(),
          gh<_i65.GetUserUsecase>(),
        ));
    gh.lazySingleton<_i73.SignInWithGoogleUsecase>(
        () => _i73.SignInWithGoogleUsecase(gh<_i52.AppRepository>()));
    gh.lazySingleton<_i74.SignOutUsecase>(
        () => _i74.SignOutUsecase(gh<_i70.SettingRepository>()));
    gh.factory<_i75.SignUpCubit>(() => _i75.SignUpCubit(
          gh<_i40.SignUpUsecase>(),
          gh<_i43.UpdateUserRoleUsecase>(),
        ));
    gh.lazySingleton<_i76.UpdateEducationUsecase>(
        () => _i76.UpdateEducationUsecase(gh<_i45.AccountRepository>()));
    gh.lazySingleton<_i77.UpdateExperienceUsecase>(
        () => _i77.UpdateExperienceUsecase(gh<_i45.AccountRepository>()));
    gh.lazySingleton<_i78.UpdateUserProfile>(
        () => _i78.UpdateUserProfile(gh<_i45.AccountRepository>()));
    gh.lazySingleton<_i79.UploadImageUsecase>(
        () => _i79.UploadImageUsecase(gh<_i45.AccountRepository>()));
    gh.factory<_i80.AccountCubit>(() => _i80.AccountCubit(
          gh<_i61.GetCurrentUserUsecase>(),
          gh<_i7.ImagePicker>(),
          gh<_i79.UploadImageUsecase>(),
          gh<_i78.UpdateUserProfile>(),
          gh<_i49.AddExperienceUsecase>(),
          gh<_i56.DeleteExperienceUsecase>(),
          gh<_i77.UpdateExperienceUsecase>(),
          gh<_i48.AddEducationUsecase>(),
          gh<_i55.DeleteEducatonUsecase>(),
          gh<_i76.UpdateEducationUsecase>(),
          gh<_i62.GetProfileUsecase>(),
        ));
    gh.factory<_i81.AppCubit>(() => _i81.AppCubit(
          gh<_i59.GetCurrentUserAuthUsecase>(),
          gh<_i65.GetUserUsecase>(),
          gh<_i73.SignInWithGoogleUsecase>(),
          gh<_i68.SaveUserDataUsecase>(),
        ));
    gh.factory<_i82.CourseCubit>(() => _i82.CourseCubit(
          gh<_i60.GetCurrentUserDataUsecase>(),
          gh<_i47.AddCourseUsecase>(),
          gh<_i20.GetAllCourseUsecase>(),
          gh<_i21.GetCategoriesUsecase>(),
          gh<_i29.RegisterUsecase>(),
          gh<_i64.GetRegisteredCourseUsecase>(),
          gh<_i7.ImagePicker>(),
          gh<_i79.UploadImageUsecase>(),
          gh<_i50.AddFavoriteUsecase>(),
          gh<_i22.GetFavoriteUsecase>(),
          gh<_i30.RemoveFavoriteUsecase>(),
          gh<_i42.UpdateCourseUsecase>(),
        ));
    gh.factory<_i83.FavoriteCubit>(() => _i83.FavoriteCubit(
          gh<_i22.GetFavoriteUsecase>(),
          gh<_i60.GetCurrentUserDataUsecase>(),
        ));
    gh.lazySingleton<_i84.GetLanguageUsecase>(
        () => _i84.GetLanguageUsecase(gh<_i70.SettingRepository>()));
    gh.lazySingleton<_i85.SetLanguageUsecase>(
        () => _i85.SetLanguageUsecase(gh<_i70.SettingRepository>()));
    gh.factory<_i86.SettingCubit>(() => _i86.SettingCubit(
          gh<_i74.SignOutUsecase>(),
          gh<_i84.GetLanguageUsecase>(),
          gh<_i85.SetLanguageUsecase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i87.InjectionModule {}
