import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/app_constants.dart';

import '../../../../core/navigator/app_navigator.dart';
import '../../../../core/routes/route_path.dart';
import '../../../../core/usecases/no_params.dart';
import '../../domain/usecases/sign_out_usecase.dart';

part 'setting_state.dart';
part 'setting_cubit.freezed.dart';

@injectable
class SettingCubit extends Cubit<SettingState> {
  final SignOutUsecase _signOutUsecase;
  SettingCubit(this._signOutUsecase) : super(const SettingState());

  Future<void> signOut() async {
    final result = await _signOutUsecase(NoParams());
    if (result.isLeft()) {
      emit(state.copyWith(status: DataStatus.failure));
    } else {
      AppNavigator.pushAndRemoveUntil(RoutePath.initRoute);
    }
  }
}
