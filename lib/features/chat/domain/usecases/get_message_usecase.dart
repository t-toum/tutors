import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/models/message.dart';
import '../../../../core/usecases/usecase_sync.dart';
import '../repositories/chat_repository.dart';

@lazySingleton
class GetMessageUsecase
    implements SynchronousUseCase<Stream<List<Message>>, GetMessageParams> {
  final ChatRepository _repository;

  GetMessageUsecase(this._repository);

  @override
  Stream<List<Message>> call(GetMessageParams params) {
    return _repository.getMessage(
      senderID: params.senderID,
      receiverID: params.receiverID,
    );
  }
}

class GetMessageParams {
  final String senderID;
  final String receiverID;

  GetMessageParams({
    required this.senderID,
    required this.receiverID,
  });
}
