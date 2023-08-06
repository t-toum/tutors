part of 'chat_cubit.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default(DataStatus.initial)
    DataStatus status,
    String? error,
  }) = _Initial;
}
