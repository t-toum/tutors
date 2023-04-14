part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(DataStatus.initial)
    final DataStatus status,
    final String? error,
    final bool? isAuth,
    final String? userId,
    final Users? currentUsers,
  }) = _Initial;
}
