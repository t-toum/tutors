part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(DataStatus.initial)
    final DataStatus status,
    final String? error,

  }) = _Initial;
}
