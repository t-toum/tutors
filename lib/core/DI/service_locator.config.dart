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
import 'package:shared_preferences/shared_preferences.dart' as _i9;
import 'package:tutors/core/DI/register_modules.dart' as _i47;
import 'package:tutors/core/services/auth_service.dart' as _i11;
import 'package:tutors/core/services/cloud_firestore_service.dart' as _i12;
import 'package:tutors/core/services/shared_preference_service.dart' as _i16;
import 'package:tutors/core/services/storage_service.dart' as _i10;
import 'package:tutors/features/account/data/datasources/account_remote_datasource.dart'
    as _i27;
import 'package:tutors/features/account/data/repositories/account_repository_impl.dart'
    as _i29;
import 'package:tutors/features/account/domain/repositories/account_repository.dart'
    as _i28;
import 'package:tutors/features/account/domain/usecases/get_current_user_usecase.dart'
    as _i35;
import 'package:tutors/features/account/domain/usecases/update_user_profile.dart'
    as _i42;
import 'package:tutors/features/account/domain/usecases/upload_image_usecase.dart'
    as _i43;
import 'package:tutors/features/account/presentation/cubit/account_cubit.dart'
    as _i44;
import 'package:tutors/features/app/data/datasources/app_remote_datasource.dart'
    as _i30;
import 'package:tutors/features/app/data/repositories/app_repository_impl.dart'
    as _i32;
import 'package:tutors/features/app/domain/repository/app_repository.dart'
    as _i31;
import 'package:tutors/features/app/domain/usecases/get_current_user_auth_usecase.dart'
    as _i33;
import 'package:tutors/features/app/domain/usecases/get_user_usecase.dart'
    as _i36;
import 'package:tutors/features/app/domain/usecases/save_user_data_usecase.dart'
    as _i38;
import 'package:tutors/features/app/domain/usecases/sign_in_google_usecase.dart'
    as _i40;
import 'package:tutors/features/app/presentation/cubit/app_cubit.dart' as _i45;
import 'package:tutors/features/courses/presentation/cubit/course_cubit.dart'
    as _i46;
import 'package:tutors/features/home/data/datasources/home_remote_datasource.dart'
    as _i13;
import 'package:tutors/features/home/data/repositories/home_ropository_impl.dart'
    as _i15;
import 'package:tutors/features/home/domain/repositories/home_repository.dart'
    as _i14;
import 'package:tutors/features/home/domain/usecases/get_current_user_usecase.dart'
    as _i34;
import 'package:tutors/features/home/domain/usecases/sign_out_usecase.dart'
    as _i21;
import 'package:tutors/features/home/presentation/cubit/home_cubit.dart'
    as _i37;
import 'package:tutors/features/sign_in/data/datasources/sign_in_remote_datasorece.dart'
    as _i17;
import 'package:tutors/features/sign_in/data/repositories/sign_in_repository_impl.dart'
    as _i19;
import 'package:tutors/features/sign_in/domain/repositories/sign_in_repository.dart'
    as _i18;
import 'package:tutors/features/sign_in/domain/usecases/sign_in_usecase.dart'
    as _i20;
import 'package:tutors/features/sign_in/presentation/cubit/sign_in_cubit.dart'
    as _i39;
import 'package:tutors/features/sign_up/data/datasources/sign_up_remote_datasorece.dart'
    as _i22;
import 'package:tutors/features/sign_up/data/repositories/sign_up_repository_impl.dart'
    as _i24;
import 'package:tutors/features/sign_up/domain/repositories/sign_up_repository.dart'
    as _i23;
import 'package:tutors/features/sign_up/domain/usecases/sign_up_usecase.dart'
    as _i25;
import 'package:tutors/features/sign_up/domain/usecases/update_user_role_usecase.dart'
    as _i26;
import 'package:tutors/features/sign_up/presentation/cubit/sign_up_cubit.dart'
    as _i41; // ignore_for_file: unnecessary_lambdas

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
    await gh.factoryAsync<_i9.SharedPreferences>(
      () => injectionModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i10.StorageService>(
        () => _i10.StorageServiceImpl(gh<_i5.FirebaseStorage>()));
    gh.singleton<_i11.AuthService>(_i11.AuthService(gh<_i3.FirebaseAuth>()));
    gh.lazySingleton<_i12.CouldFireStoreService>(
        () => _i12.CouldFireStoreServiceImpl(gh<_i4.FirebaseFirestore>()));
    gh.lazySingleton<_i13.HomeRemoteDatasource>(
        () => _i13.HomeRemoteDatasourceImpl(
              gh<_i11.AuthService>(),
              gh<_i12.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i14.HomeRepository>(
        () => _i15.HomeRepositoryImpl(gh<_i13.HomeRemoteDatasource>()));
    gh.lazySingleton<_i16.SharedPreferenceService>(
        () => _i16.SharedPreferenceServiceImpl(gh<_i9.SharedPreferences>()));
    gh.lazySingleton<_i17.SignInRemoteDatasource>(
        () => _i17.SignInRemoteDatasourceImpl(gh<_i11.AuthService>()));
    gh.lazySingleton<_i18.SignInRepository>(
        () => _i19.SignInRepositoryImpl(gh<_i17.SignInRemoteDatasource>()));
    gh.lazySingleton<_i20.SignInUsecase>(
        () => _i20.SignInUsecase(gh<_i18.SignInRepository>()));
    gh.lazySingleton<_i21.SignOutUsecase>(
        () => _i21.SignOutUsecase(gh<_i14.HomeRepository>()));
    gh.lazySingleton<_i22.SignUpRemoteDatasource>(
        () => _i22.SignUpRemoteDatasourceImpl(
              gh<_i11.AuthService>(),
              gh<_i12.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i23.SignUpRepository>(
        () => _i24.SignUpRepositoryImpl(gh<_i22.SignUpRemoteDatasource>()));
    gh.lazySingleton<_i25.SignUpUsecase>(
        () => _i25.SignUpUsecase(gh<_i23.SignUpRepository>()));
    gh.lazySingleton<_i26.UpdateUserRoleUsecase>(
        () => _i26.UpdateUserRoleUsecase(gh<_i23.SignUpRepository>()));
    gh.lazySingleton<_i27.AccountRemoteDatasource>(
        () => _i27.AccountRemoteDatasourceImpl(
              gh<_i11.AuthService>(),
              gh<_i12.CouldFireStoreService>(),
              gh<_i10.StorageService>(),
            ));
    gh.lazySingleton<_i28.AccountRepository>(
        () => _i29.AccountRepositoryImpl(gh<_i27.AccountRemoteDatasource>()));
    gh.lazySingleton<_i30.AppRemoteDatasource>(
        () => _i30.AppRemoteDatasourceImpl(
              gh<_i11.AuthService>(),
              gh<_i12.CouldFireStoreService>(),
            ));
    gh.lazySingleton<_i31.AppRepository>(
        () => _i32.AppRepositoryImpl(gh<_i30.AppRemoteDatasource>()));
    gh.lazySingleton<_i33.GetCurrentUserAuthUsecase>(
        () => _i33.GetCurrentUserAuthUsecase(gh<_i31.AppRepository>()));
    gh.lazySingleton<_i34.GetCurrentUserDataUsecase>(
        () => _i34.GetCurrentUserDataUsecase(gh<_i14.HomeRepository>()));
    gh.lazySingleton<_i35.GetCurrentUserUsecase>(
        () => _i35.GetCurrentUserUsecase(gh<_i28.AccountRepository>()));
    gh.lazySingleton<_i36.GetUserUsecase>(
        () => _i36.GetUserUsecase(gh<_i31.AppRepository>()));
    gh.factory<_i37.HomeCubit>(() => _i37.HomeCubit(
          gh<_i21.SignOutUsecase>(),
          gh<_i34.GetCurrentUserDataUsecase>(),
        ));
    gh.lazySingleton<_i38.SaveUserDataUsecase>(
        () => _i38.SaveUserDataUsecase(gh<_i31.AppRepository>()));
    gh.factory<_i39.SignInCubit>(() => _i39.SignInCubit(
          gh<_i20.SignInUsecase>(),
          gh<_i36.GetUserUsecase>(),
        ));
    gh.lazySingleton<_i40.SignInWithGoogleUsecase>(
        () => _i40.SignInWithGoogleUsecase(gh<_i31.AppRepository>()));
    gh.factory<_i41.SignUpCubit>(() => _i41.SignUpCubit(
          gh<_i25.SignUpUsecase>(),
          gh<_i26.UpdateUserRoleUsecase>(),
        ));
    gh.lazySingleton<_i42.UpdateUserProfile>(
        () => _i42.UpdateUserProfile(gh<_i28.AccountRepository>()));
    gh.lazySingleton<_i43.UploadImageUsecase>(
        () => _i43.UploadImageUsecase(gh<_i28.AccountRepository>()));
    gh.factory<_i44.AccountCubit>(() => _i44.AccountCubit(
          gh<_i35.GetCurrentUserUsecase>(),
          gh<_i6.ImagePicker>(),
          gh<_i43.UploadImageUsecase>(),
          gh<_i42.UpdateUserProfile>(),
        ));
    gh.factory<_i45.AppCubit>(() => _i45.AppCubit(
          gh<_i33.GetCurrentUserAuthUsecase>(),
          gh<_i36.GetUserUsecase>(),
          gh<_i40.SignInWithGoogleUsecase>(),
          gh<_i38.SaveUserDataUsecase>(),
        ));
    gh.factory<_i46.CourseCubit>(
        () => _i46.CourseCubit(gh<_i34.GetCurrentUserDataUsecase>()));
    return this;
  }
}

class _$InjectionModule extends _i47.InjectionModule {}
