import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/error/failures.dart';
import 'package:tutors/core/models/chat_room.dart';
import 'package:tutors/core/usecases/usecase.dart';

import '../repositories/chat_repository.dart';

@lazySingleton
class CreateChatRoomUsecase implements UseCase<String?, ChatRoom> {
  final ChatRepository _repository;
  CreateChatRoomUsecase(this._repository);

  @override
  Future<Either<Failure, String?>> call(ChatRoom params) async {
    return _repository.createChatRoom(chatRoom: params);
  }
}
