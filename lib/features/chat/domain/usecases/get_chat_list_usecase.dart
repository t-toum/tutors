import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/models/chats.dart';
import '../../../../core/usecases/usecase_sync.dart';
import '../repositories/chat_repository.dart';

@lazySingleton
class GetChatListUsecase
    implements SynchronousUseCase<Stream<List<Chat>>, String> {
  final ChatRepository _repository;
  GetChatListUsecase(this._repository);

  @override
  Stream<List<Chat>> call(String params) {
    return _repository.getChatList(
      senderID: params,
    );
  }
}