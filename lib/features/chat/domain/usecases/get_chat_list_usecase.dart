import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/models/chat_room.dart';
import '../../../../core/usecases/usecase_sync.dart';
import '../repositories/chat_repository.dart';

@lazySingleton
class GetChatListUsecase
    implements SynchronousUseCase<Stream<List<ChatRoom>>, String> {
  final ChatRepository _repository;
  GetChatListUsecase(this._repository);

  @override
  Stream<List<ChatRoom>> call(String params) {
    return _repository.getChatList(
      senderID: params,
    );
  }
}