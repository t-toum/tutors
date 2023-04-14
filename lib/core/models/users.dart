import 'package:freezed_annotation/freezed_annotation.dart';
part 'users.freezed.dart';
part 'users.g.dart';
@freezed
class Users with _$Users {
  const factory Users({
    final String? id,
    final String? username,
    final String? role,
  })=_Users;
  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
}