import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tutors/core/models/education.dart';

import '../utils/json_coverter.dart';
import 'experience.dart';

part 'users.freezed.dart';
part 'users.g.dart';

@freezed
class Users with _$Users {
  const factory Users({
    final String? id,
    final String? firstName,
    final String? lastName,
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
    final String? gender,
    @TimestampConverter() final DateTime? birthDay,
    final String? address,
    final String? phone,
    final List<Education>? educations,
    final List<Experience>? experiences,
    final List<String>? skills,
    final String? about
  }) = _Users;
  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
}
