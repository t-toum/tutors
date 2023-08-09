import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/message.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repositories/chat_repository.dart';

@lazySingleton
class SendMessageUsecase implements UseCase<void, Message> {
  final ChatRepository _repository;
  SendMessageUsecase(this._repository);

  @override
  Future<Either<Failure, void>> call(Message params) async {
    return await _repository.sendMessage(chatData: params);
  }
}
