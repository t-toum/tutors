import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/extensions/either_extension.dart';
import 'package:tutors/core/usecases/no_params.dart';

import '../../domain/usecases/get_current_user_auth_usecase.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  final GetCurrentUserAuthUsecase _getCurrentUserAuthUsecase;
  AppCubit(this._getCurrentUserAuthUsecase) : super(const AppState());

  Future<void> getAuthentication() async {
    emit(state.copyWith(status: DataStatus.loading));
    final auth = await _getCurrentUserAuthUsecase(NoParams());
    if (auth.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: auth.getLeft()?.msg));
    } else {
      final user = auth.getRight();
      emit(state.copyWith(
          status: DataStatus.success, isAuth: user!= null));
    }
  }
}
