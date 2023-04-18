part of 'setting_cubit.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState({
    @Default(DataStatus.initial)
    final DataStatus status,
    final String? error,
  }) = _Initial;
}
