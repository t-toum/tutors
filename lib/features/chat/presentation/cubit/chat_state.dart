part of 'chat_cubit.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default(DataStatus.initial)
    DataStatus status,
    String? error,
    List<ChatRoom>?chatList,
    Users? currentUser,
    Users? reveiver,
    List<Message>? lisMessage,
    String? senderID,
    String? receiverID,
    String? currentRoomId,
  }) = _Initial;
}
