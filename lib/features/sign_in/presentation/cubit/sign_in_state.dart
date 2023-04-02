part of 'sign_in_cubit.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default(DataStatus.initial)
    final DataStatus status,
    final String? error,
  }) = _Initial;
}
