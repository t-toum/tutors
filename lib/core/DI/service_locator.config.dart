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
import 'package:tutors/core/DI/register_modules.dart' as _i94;
import 'package:tutors/core/services/auth_service.dart' as _i11;
import 'package:tutors/core/services/cloud_firestore_service.dart' as _i12;
import 'package:tutors/core/services/shared_preference_service.dart' as _i31;
import 'package:tutors/core/services/storage_service.dart' as _i10;
import 'package:tutors/features/account/data/datasources/account_remote_datasource.dart'
    as _i43;
import 'package:tutors/features/account/data/repositories/account_repository_impl.dart'
    as _i45;
import 'package:tutors/features/account/domain/repositories/account_repository.dart'
    as _i44;
import 'package:tutors/features/account/domain/usecases/add_education_usecase.dart'
    as _i47;
import 'package:tutors/features/account/domain/usecases/add_experience_usecase.dart'
    as _i48;
import 'package:tutors/features/account/domain/usecases/delete_education_usecase.dart'
    as _i57;
import 'package:tutors/features/account/domain/usecases/delete_experience_usecase.dart'
    as _i58;
import 'package:tutors/features/account/domain/usecases/get_current_user_usecase.dart'
    as _i64;
import 'package:tutors/features/account/domain/usecases/get_profile_usecase.dart'
    as _i66;
import 'package:tutors/features/account/domain/usecases/update_education_usecase.dart'
    as _i82;
import 'package:tutors/features/account/domain/usecases/update_experience_usecase.dart'
    as _i83;
import 'package:tutors/features/account/domain/usecases/update_user_profile.dart'
    as _i84;
import 'package:tutors/features/account/domain/usecases/upload_image_usecase.dart'
    as _i85;
import 'package:tutors/features/account/presentation/cubit/account_cubit.dart'
    as _i86;
import 'package:tutors/features/app/data/datasources/app_remote_datasource.dart'
    as _i50;
import 'package:tutors/features/app/data/repositories/app_repository_impl.dart'
    as _i52;
import 'package:tutors/features/app/domain/repository/app_repository.dart'
    as _i51;
import 'package:tutors/features/app/domain/usecases/get_current_user_auth_usecase.dart'
    as _i62;
import 'package:tutors/features/app/domain/usecases/get_user_usecase.dart'
    as _i70;
import 'package:tutors/features/app/domain/usecases/save_user_data_usecase.dart'
    as _i73;
import 'package:tutors/features/app/domain/usecases/sign_in_google_usecase.dart'
    as _i79;
import 'package:tutors/features/app/presentation/cubit/app_cubit.dart' as _i87;
import 'package:tutors/features/chat/data/datasources/chat_remote_datasource.dart'
    as _i53;
import 'package:tutors/features/chat/data/repositories/chat_repository_impl.dart'
    as _i55;
import 'package:tutors/features/chat/domain/repositories/chat_repository.dart'
    as _i54;
import 'package:tutors/features/chat/domain/usecases/get_chat_list_usecase.dart'
    as _i59;
import 'package:tutors/features/chat/domain/usecases/get_message_usecase.dart'
    as _i65;
import 'package:tutors/features/chat/domain/usecases/get_user_info_usecase.dart'
    as _i69;
import 'package:tutors/features/chat/domain/usecases/send_message_usecase.dart'
    as _i74;
import 'package:tutors/features/chat/presentation/cubit/chat_cubit.dart'
    as _i88;
import 'package:tutors/features/courses/data/datasources/course_remote_datasource.dart'
    as _i13;
import 'package:tutors/features/courses/data/repositories/course_repository_impl.dart'
    as _i15;
import 'package:tutors/features/courses/domain/repositories/course_repository.dart'
    as _i14;
import 'package:tutors/features/courses/domain/usecases/add_course_usecase.dart'
    as _i46;
import 'package:tutors/features/courses/domain/usecases/get_all_course_usecase.dart'
    as _i19;
import 'package:tutors/features/courses/domain/usecases/get_categories_usecase.dart'
    as _i20;
import 'package:tutors/features/courses/domain/usecases/register_usecase.dart'
    as _i28;
import 'package:tutors/features/courses/domain/usecases/update_course_usecase.dart'
    as _i41;
import 'package:tutors/features/courses/presentation/cubit/course_cubit.dart'
    as _i89;
import 'package:tutors/features/favorites/data/datasources/favorite_remote_datasource.dart'
    as _i16;
import 'package:tutors/features/favorites/data/repositories/favorite_repository_impl.dart'
    as _i18;
import 'package:tutors/features/favorites/domain/repositories/favorite_repository.dart'
    as _i17;
import 'package:tutors/features/favorites/domain/usecases/add_favorite_usecase.dart'
    as _i49;
import 'package:tutors/features/favorites/domain/usecases/get_favorite_usecase.dart'
    as _i21;
import 'package:tutors/features/favorites/domain/usecases/remove_favorite_usecase.dart'
    as _i29;
import 'package:tutors/features/favorites/presentation/cubit/favorite_cubit.dart'
    as _i90;
import 'package:tutors/features/home/data/datasources/home_remote_datasource.dart'
    as _i22;
import 'package:tutors/features/home/data/repositories/home_ropository_impl.dart'
    as _i24;
import 'package:tutors/features/home/domain/repositories/home_repository.dart'
    as _i23;
import 'package:tutors/features/home/domain/usecases/get_current_user_usecase.dart'
    as _i63;
import 'package:tutors/features/home/presentation/cubit/home_cubit.dart'
    as _i71;
import 'package:tutors/features/my_courses/data/datasources/my_course_remote_datasource.dart'
    as _i25;
import 'package:tutors/features/my_courses/data/repositories/my_course_repository_impl.dart'
    as _i27;
import 'package:tutors/features/my_courses/domain/repositories/my_course_repository.dart'
    as _i26;
import 'package:tutors/features/my_courses/domain/usecases/delete_course_usecase.dart'
    as _i56;
import 'package:tutors/features/my_courses/domain/usecases/get_course_detail_usecase.dart'
    as _i60;
import 'package:tutors/features/my_courses/domain/usecases/get_created_course_usecase.dart'
    as _i61;
import 'package:tutors/features/my_courses/domain/usecases/get_register_by_course_usecase.dart'
    as _i67;
import 'package:tutors/features/my_courses/domain/usecases/get_registered_course_usecase.dart'
    as _i68;
import 'package:tutors/features/my_courses/domain/usecases/update_course_status_usecase.dart'
    as _i40;
import 'package:tutors/features/my_courses/presentation/cubit/my_course_cubit.dart'
    as _i72;
import 'package:tutors/features/settings/data/datasources/setting_local_datasource.dart'
    as _i75;
import 'package:tutors/features/settings/data/datasources/setting_remote_datasource.dart'
    as _i30;
import 'package:tutors/features/settings/data/repositories/setting_repository_impl.dart'
    as _i77;
import 'package:tutors/features/settings/domain/repositories/setting_repository.dart'
    as _i76;
import 'package:tutors/features/settings/domain/usecases/get_language_usecase.dart'
    as _i91;
import 'package:tutors/features/settings/domain/usecases/set_language_usecase.dart'
    as _i92;
import 'package:tutors/features/settings/domain/usecases/sign_out_usecase.dart'
    as _i80;
import 'package:tutors/features/settings/presentation/cubit/setting_cubit.dart'
    as _i93;
import 'package:tutors/features/sign_in/data/datasources/sign_in_remote_datasorece.dart'
    as _i32;
import 'package:tutors/features/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i34;
import 'package:tutors/features/sign_in/domain/repositories/sign_in_repository.dart'
    as _i33;
import 'package:tutors/features/sign_in/domain/usecases/sign_in_usecase.dart'
    as _i35;
import 'package:tutors/features/sign_in/presentation/cubit/sign_in_cubit.dart'
    as _i78;
import 'package:tutors/features/sign_up/data/datasources/sign_up_remote_datasorece.dart'
    as _i36;
import 'package:tutors/features/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i38;
import 'package:tutors/features/sign_up/domain/repositories/sign_up_repository.dart'
    as _i37;
import 'package:tutors/features/sign_up/domain/usecases/sign_up_usecase.dart'
    as _i39;
import 'package:tutors/features/sign_up/domain/usecases/update_user_role_usecase.dart'
    as _i42;
import 'package:tutors/features/sign_up/presentation/cubit/sign_up_cubit.dart'
    as _i81;

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
    gh.lazySingleton<_i40.UpdateCourseStatusUsecase>(
        () => _i40.UpdateCourseStatusUsecase(gh<_i26.MyCourseRepository>()));
    gh.lazySingleton<_i41.UpdateCourseUsecase>(
        () => _i41.UpdateCourseUsecase(gh<_i14.CourseRepository>()));
    gh.lazySingleton<_i42.UpdateUserRoleUsecase>(
        () => _i42.UpdateUserRoleUsecase(gh<_i37.SignUpRepository>()));
    gh.lazySingleton<_i43.AccountRemoteDatasource>(
        () => _i43.AccountRemoteDatasourceImpl(
              gh<_i11.AuthService>(),
              gh<_i12.CouldFireStoreService>(),
              gh<_i10.StorageService>(),
            ));
    gh.lazySingleton<_i44.AccountRepository>(
        () => _i45.AccountRepositoryImpl(gh<_i43.AccountRemoteDatasource>()));
    gh.lazySingleton<_i46.AddCourseUsecase>(
        () => _i46.AddCourseUsecase(gh<_i14.CourseRepository>()));
    gh.lazySingleton<_i47.AddEducationUsecase>(
        () => _i47.AddEducationUsecase(gh<_i44.AccountRepository>()));
    gh.lazySingleton<_i48.AddExperienceUsecase>(
        () => _i48.AddExperienceUsecase(gh<_i44.AccountRepository>()));
    gh.lazySingleton<_i49.AddFavoriteUsecase>(
        () => _i49.AddFavoriteUsecase(gh<_i17.FavoriteRepository>()));
    gh.lazySingleton<_i50.AppRemoteDatasource>(
        () => _i50.AppRemoteDatasourceImpl(
              gh<_i11.AuthService>(),
              gh<_i12.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i51.AppRepository>(
        () => _i52.AppRepositoryImpl(gh<_i50.AppRemoteDatasource>()));
    gh.lazySingleton<_i53.ChatRemoteDatasource>(
        () => _i53.ChatRemoteDatasourceImpl(
              gh<_i4.FirebaseFirestore>(),
              gh<_i12.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i54.ChatRepository>(
        () => _i55.ChatRepositoryImpl(gh<_i53.ChatRemoteDatasource>()));
    gh.lazySingleton<_i56.DeleteCourseUsecase>(
        () => _i56.DeleteCourseUsecase(gh<_i26.MyCourseRepository>()));
    gh.lazySingleton<_i57.DeleteEducatonUsecase>(
        () => _i57.DeleteEducatonUsecase(gh<_i44.AccountRepository>()));
    gh.lazySingleton<_i58.DeleteExperienceUsecase>(
        () => _i58.DeleteExperienceUsecase(gh<_i44.AccountRepository>()));
    gh.lazySingleton<_i59.GetChatListUsecase>(
        () => _i59.GetChatListUsecase(gh<_i54.ChatRepository>()));
    gh.lazySingleton<_i60.GetCourseDetailUsecase>(
        () => _i60.GetCourseDetailUsecase(gh<_i26.MyCourseRepository>()));
    gh.lazySingleton<_i61.GetCreatedCourse>(
        () => _i61.GetCreatedCourse(gh<_i26.MyCourseRepository>()));
    gh.lazySingleton<_i62.GetCurrentUserAuthUsecase>(
        () => _i62.GetCurrentUserAuthUsecase(gh<_i51.AppRepository>()));
    gh.lazySingleton<_i63.GetCurrentUserDataUsecase>(
        () => _i63.GetCurrentUserDataUsecase(gh<_i23.HomeRepository>()));
    gh.lazySingleton<_i64.GetCurrentUserUsecase>(
        () => _i64.GetCurrentUserUsecase(gh<_i44.AccountRepository>()));
    gh.lazySingleton<_i65.GetMessageUsecase>(
        () => _i65.GetMessageUsecase(gh<_i54.ChatRepository>()));
    gh.lazySingleton<_i66.GetProfileUsecase>(
        () => _i66.GetProfileUsecase(gh<_i44.AccountRepository>()));
    gh.lazySingleton<_i67.GetRegisterbyCourseUsecase>(
        () => _i67.GetRegisterbyCourseUsecase(gh<_i26.MyCourseRepository>()));
    gh.lazySingleton<_i68.GetRegisteredCourseUsecase>(
        () => _i68.GetRegisteredCourseUsecase(gh<_i26.MyCourseRepository>()));
    gh.lazySingleton<_i69.GetUserInfoUsecase>(
        () => _i69.GetUserInfoUsecase(gh<_i54.ChatRepository>()));
    gh.lazySingleton<_i70.GetUserUsecase>(
        () => _i70.GetUserUsecase(gh<_i51.AppRepository>()));
    gh.factory<_i71.HomeCubit>(
        () => _i71.HomeCubit(gh<_i63.GetCurrentUserDataUsecase>()));
    gh.factory<_i72.MyCourseCubit>(() => _i72.MyCourseCubit(
          gh<_i68.GetRegisteredCourseUsecase>(),
          gh<_i63.GetCurrentUserDataUsecase>(),
          gh<_i61.GetCreatedCourse>(),
          gh<_i60.GetCourseDetailUsecase>(),
          gh<_i67.GetRegisterbyCourseUsecase>(),
          gh<_i40.UpdateCourseStatusUsecase>(),
          gh<_i56.DeleteCourseUsecase>(),
        ));
    gh.lazySingleton<_i73.SaveUserDataUsecase>(
        () => _i73.SaveUserDataUsecase(gh<_i51.AppRepository>()));
    gh.lazySingleton<_i74.SendMessageUsecase>(
        () => _i74.SendMessageUsecase(gh<_i54.ChatRepository>()));
    gh.lazySingleton<_i75.SettingLocalDatasource>(() =>
        _i75.SettingLocalDatasourceImpl(gh<_i31.SharedPreferenceService>()));
    gh.lazySingleton<_i76.SettingRepository>(() => _i77.SettingRepositoryImpl(
          gh<_i30.SettingRemoteDatasource>(),
          gh<_i75.SettingLocalDatasource>(),
        ));
    gh.factory<_i78.SignInCubit>(() => _i78.SignInCubit(
          gh<_i35.SignInUsecase>(),
          gh<_i70.GetUserUsecase>(),
        ));
    gh.lazySingleton<_i79.SignInWithGoogleUsecase>(
        () => _i79.SignInWithGoogleUsecase(gh<_i51.AppRepository>()));
    gh.lazySingleton<_i80.SignOutUsecase>(
        () => _i80.SignOutUsecase(gh<_i76.SettingRepository>()));
    gh.factory<_i81.SignUpCubit>(() => _i81.SignUpCubit(
          gh<_i39.SignUpUsecase>(),
          gh<_i42.UpdateUserRoleUsecase>(),
        ));
    gh.lazySingleton<_i82.UpdateEducationUsecase>(
        () => _i82.UpdateEducationUsecase(gh<_i44.AccountRepository>()));
    gh.lazySingleton<_i83.UpdateExperienceUsecase>(
        () => _i83.UpdateExperienceUsecase(gh<_i44.AccountRepository>()));
    gh.lazySingleton<_i84.UpdateUserProfile>(
        () => _i84.UpdateUserProfile(gh<_i44.AccountRepository>()));
    gh.lazySingleton<_i85.UploadImageUsecase>(
        () => _i85.UploadImageUsecase(gh<_i44.AccountRepository>()));
    gh.factory<_i86.AccountCubit>(() => _i86.AccountCubit(
          gh<_i64.GetCurrentUserUsecase>(),
          gh<_i6.ImagePicker>(),
          gh<_i85.UploadImageUsecase>(),
          gh<_i84.UpdateUserProfile>(),
          gh<_i48.AddExperienceUsecase>(),
          gh<_i58.DeleteExperienceUsecase>(),
          gh<_i83.UpdateExperienceUsecase>(),
          gh<_i47.AddEducationUsecase>(),
          gh<_i57.DeleteEducatonUsecase>(),
          gh<_i82.UpdateEducationUsecase>(),
          gh<_i66.GetProfileUsecase>(),
        ));
    gh.factory<_i87.AppCubit>(() => _i87.AppCubit(
          gh<_i62.GetCurrentUserAuthUsecase>(),
          gh<_i70.GetUserUsecase>(),
          gh<_i79.SignInWithGoogleUsecase>(),
          gh<_i73.SaveUserDataUsecase>(),
        ));
    gh.factory<_i88.ChatCubit>(() => _i88.ChatCubit(
          gh<_i59.GetChatListUsecase>(),
          gh<_i69.GetUserInfoUsecase>(),
          gh<_i65.GetMessageUsecase>(),
          gh<_i74.SendMessageUsecase>(),
        ));
    gh.factory<_i89.CourseCubit>(() => _i89.CourseCubit(
          gh<_i63.GetCurrentUserDataUsecase>(),
          gh<_i46.AddCourseUsecase>(),
          gh<_i19.GetAllCourseUsecase>(),
          gh<_i20.GetCategoriesUsecase>(),
          gh<_i28.RegisterUsecase>(),
          gh<_i68.GetRegisteredCourseUsecase>(),
          gh<_i6.ImagePicker>(),
          gh<_i85.UploadImageUsecase>(),
          gh<_i49.AddFavoriteUsecase>(),
          gh<_i21.GetFavoriteUsecase>(),
          gh<_i29.RemoveFavoriteUsecase>(),
          gh<_i41.UpdateCourseUsecase>(),
        ));
    gh.factory<_i90.FavoriteCubit>(() => _i90.FavoriteCubit(
          gh<_i21.GetFavoriteUsecase>(),
          gh<_i63.GetCurrentUserDataUsecase>(),
        ));
    gh.lazySingleton<_i91.GetLanguageUsecase>(
        () => _i91.GetLanguageUsecase(gh<_i76.SettingRepository>()));
    gh.lazySingleton<_i92.SetLanguageUsecase>(
        () => _i92.SetLanguageUsecase(gh<_i76.SettingRepository>()));
    gh.factory<_i93.SettingCubit>(() => _i93.SettingCubit(
          gh<_i80.SignOutUsecase>(),
          gh<_i91.GetLanguageUsecase>(),
          gh<_i92.SetLanguageUsecase>(),
        ));
    return this;
  }
}

class _$InjectionModule extends _i94.InjectionModule {}
