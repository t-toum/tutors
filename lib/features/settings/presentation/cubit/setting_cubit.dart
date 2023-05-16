import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/extensions/either_extension.dart';

import '../../../../core/navigator/app_navigator.dart';
import '../../../../core/routes/route_path.dart';
import '../../../../core/usecases/no_params.dart';
import '../../domain/usecases/get_language_usecase.dart';
import '../../domain/usecases/set_language_usecase.dart';
import '../../domain/usecases/sign_out_usecase.dart';

part 'setting_cubit.freezed.dart';
part 'setting_state.dart';

@injectable
class SettingCubit extends Cubit<SettingState> {
  final SignOutUsecase _signOutUsecase;
  final GetLanguageUsecase _getLanguageUsecase;
  final SetLanguageUsecase _setLanguageUsecase;
  SettingCubit(
    this._signOutUsecase,
    this._getLanguageUsecase,
    this._setLanguageUsecase,
  ) : super(const SettingState());

  Future<void> signOut() async {
    final result = await _signOutUsecase(NoParams());
    if (result.isLeft()) {
      emit(state.copyWith(status: DataStatus.failure));
    } else {
      AppNavigator.pushAndRemoveUntil(RoutePath.initRoute);
    }
  }

  Future<void> getLanguage() async {
    emit(state.copyWith(status: DataStatus.loading));
    final langCode = _getLanguageUsecase(NoParams());
    emit(
        state.copyWith(status: DataStatus.success, language: langCode ?? 'en'));
  }

  Future<void> setLanguage({String? code}) async {
    emit(state.copyWith(status: DataStatus.loading, isSetlang: false));
    final result = await _setLanguageUsecase(code);
    if (result.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: result.getLeft()?.msg));
    } else {
      emit(state.copyWith(
          status: DataStatus.success, language: code ?? 'en', isSetlang: true));
    }
  }
}
