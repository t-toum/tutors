import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/extensions/either_extension.dart';
import 'package:tutors/core/models/users.dart';
import 'package:tutors/core/usecases/no_params.dart';

import '../../../../core/models/favorite.dart';
import '../../../home/domain/usecases/get_current_user_usecase.dart';
import '../../domain/usecases/get_favorite_usecase.dart';

part 'favorite_cubit.freezed.dart';
part 'favorite_state.dart';

@injectable
class FavoriteCubit extends Cubit<FavoriteState> {
  final GetFavoriteUsecase _getFavoriteUsecase;
  final GetCurrentUserDataUsecase _getCurrentUserDataUsecase;
  FavoriteCubit(
    this._getFavoriteUsecase,
    this._getCurrentUserDataUsecase,
  ) : super(const FavoriteState());

  Future<void> getCurrentUser() async {
    emit(state.copyWith(status: DataStatus.loading));
    final result = await _getCurrentUserDataUsecase(NoParams());
    if (result.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: result.getLeft()?.msg));
    } else {
      emit(state.copyWith(
          status: DataStatus.success, currentUser: result.getRight()));
      await getFavorite();
    }
  }

  Future<void> getFavorite() async {
    emit(state.copyWith(status: DataStatus.loading));
    final result = await _getFavoriteUsecase(state.currentUser?.id ?? '');
    if (result.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: result.getLeft()?.msg));
    } else {
      emit(state.copyWith(
        status: DataStatus.success,
        listFavorite: result.getRight(),
      ));
    }
  }
}
