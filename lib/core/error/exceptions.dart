import 'package:equatable/equatable.dart';

abstract class CustomExceptions extends Equatable {
  final String? msg;
  const CustomExceptions(this.msg);
  @override
  List<Object?> get props => [msg];
}

class ServerException extends CustomExceptions implements Exception {
  const ServerException(String? msg) : super(msg);
}

class CacheException extends CustomExceptions implements Exception {
  const CacheException(String? msg) : super(msg);
}
