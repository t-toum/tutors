import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/core/routes/route_path.dart';
import 'package:tutors/core/usecases/no_params.dart';
import 'package:tutors/features/home/domain/usecases/sign_out_usecase.dart';

import '../../domain/usecases/get_current_user_usecase.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final SignOutUsecase _signOutUsecase;
  final GetCurrentUserDataUsecase getCurrentUserDataUsecase;
  HomeCubit(this._signOutUsecase, this.getCurrentUserDataUsecase)
      : super(const HomeState());
  Future<void> signOut() async {
    final result = await _signOutUsecase(NoParams());
    if (result.isLeft()) {
      emit(state.copyWith(status: DataStatus.failure));
    } else {
      AppNavigator.pushAndRemoveUntil(RoutePath.initRoute);
    }
  }

  void onChangedTab(int index) {
    emit(state.copyWith(currentTab: index));
  }
}
