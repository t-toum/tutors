part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(DataStatus.initial)
    DataStatus status,
    String? error,
    @Default(false)
    bool isAuth,
  }) = _Initial;
}
