import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/models/message.dart';
import '../../../../core/usecases/usecase_sync.dart';
import '../repositories/chat_repository.dart';

@lazySingleton
class GetMessageUsecase
    implements SynchronousUseCase<Stream<List<Message>>, String> {
  final ChatRepository _repository;

  GetMessageUsecase(this._repository);

  @override
  Stream<List<Message>> call(String params) {
    return _repository.getMessage(
      roomId: params
    );
  }
}
