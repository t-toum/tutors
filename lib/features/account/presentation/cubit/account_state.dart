part of 'account_cubit.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState({
    @Default(DataStatus.initial)
    final DataStatus status,
    final String? error,
    final Users? currentUser,
    final bool? isPresent,
    @Default(true)
    final bool isSelf,
  }) = _Initial;
}
