part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(DataStatus.initial)
    final DataStatus status,
    final String? error,
    final String? doc,
  }) = _Initial;
}
