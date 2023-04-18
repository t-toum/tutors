import 'package:freezed_annotation/freezed_annotation.dart';
part 'users.freezed.dart';
part 'users.g.dart';

@freezed
class Users with _$Users {
  const factory Users({
    final String? id,
    final String? username,
    final String? role,
    final String? email,
    final String? tel,
    final String? profileUrl,
    final String? coverUrl,
    final String? jobTitle,
    final String? position,
    final String? industry,
    final String? country,
    final String? city,
    final List<String>? education,
    final List<String>? experience,
    final List<String>? skills,
  }) = _Users;
  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
}
