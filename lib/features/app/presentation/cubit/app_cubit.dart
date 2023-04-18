import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/extensions/either_extension.dart';
import 'package:tutors/core/models/users.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/core/routes/route_path.dart';
import 'package:tutors/core/usecases/no_params.dart';

import '../../domain/usecases/get_current_user_auth_usecase.dart';
import '../../domain/usecases/save_user_data_usecase.dart';
import '../../domain/usecases/sign_in_google_usecase.dart';
import '../../domain/usecases/get_user_usecase.dart';


part 'app_cubit.freezed.dart';
part 'app_state.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  final GetCurrentUserAuthUsecase _getCurrentUserAuthUsecase;
  final GetUserUsecase _getUserUsecase;
  final SignInWithGoogleUsecase _signInWithGoogleUsecase;
  final SaveUserDataUsecase _saveUserDataUsecase;
  AppCubit(
    this._getCurrentUserAuthUsecase,
    this._getUserUsecase,
    this._signInWithGoogleUsecase,
    this._saveUserDataUsecase,
  ) : super(const AppState());

  Future<void> getAuthentication() async {
    emit(state.copyWith(status: DataStatus.loading));
    final auth = await _getCurrentUserAuthUsecase(NoParams());
    if (auth.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: auth.getLeft()?.msg));
    } else {
      final user = auth.getRight();
      await getCurrentUserData(doc: user?.uid ?? '');
      emit(state.copyWith(
          status: DataStatus.success, isAuth: user != null, userId: user?.uid));
    }
  }

  Future<void> getCurrentUserData(
      {required String doc, bool isGoogle = false , Map<String,dynamic>? data}) async {
    emit(state.copyWith(status: DataStatus.loading));
    final currentUser = await _getUserUsecase(doc);
    if (currentUser.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: currentUser.getLeft()?.msg));
    } else {
      final userData = currentUser.getRight();
      if (isGoogle) {
        if (userData?.id != null) {
          if (userData?.role != '' && userData?.role != null) {
            AppNavigator.pushAndRemoveUntil(RoutePath.homeRoute);
          } else {
            AppNavigator.pushAndRemoveUntil(RoutePath.roleRoute, params: doc);
          }
        } else {
          await saveUserData(doc: doc,data: data??{});
        }
      } else {
        emit(
            state.copyWith(status: DataStatus.success, currentUsers: userData));
      }
    }
  }

  Future<void> sigInwithGoogle() async {
    emit(state.copyWith(status: DataStatus.loading));
    final result = await _signInWithGoogleUsecase(NoParams());
    if (result.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: result.getLeft()?.msg));
    } else {
      final credential = result.getRight()?.user;
      Users user = Users(
        id: credential?.uid,
        username: credential?.displayName,
        email: credential?.email,
      );
      await getCurrentUserData(doc: credential?.uid ?? '', isGoogle: true,data: user.toJson());
    }
  }

  Future<void> saveUserData(
      {required String doc, required Map<String, dynamic> data}) async {
    emit(state.copyWith(status: DataStatus.loading));
    final result = await _saveUserDataUsecase(
      SaveUserParams(data: data, doc: doc),
    );
    if (result.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: result.getLeft()?.msg));
    }else{
      await getCurrentUserData(doc: doc,isGoogle: true);
    }
  }
}
