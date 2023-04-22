import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    final List<String>? education,
    final List<String>? experience,
    final List<String>? skills,
  }) = _Users;
  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
}

class TimestampConverter implements JsonConverter<DateTime?, Timestamp?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Timestamp? json) {
    if (json != null) {
      DateTime? dateTime = DateTime.fromMicrosecondsSinceEpoch(json.microsecondsSinceEpoch);
      return dateTime;
    }else{
      return null;
    }
  }

  @override
  Timestamp? toJson(DateTime? object) {
    if(object!=null){
      return Timestamp.fromDate(object);
    }else{
      return null;
    }
  }
}
