import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tutors/core/models/school.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/json_coverter.dart';
part 'education.freezed.dart';
part 'education.g.dart';

@freezed
class Education with _$Education {
  const factory Education({
    final String? id,
    final School? school,
    final String? grade,
    final String? fieldStudy,
    @TimestampConverter()
    final DateTime? startDate,
    @TimestampConverter()
    final DateTime? endDate,
    final String? acctivities,
    final String? description,
  }) = _Education;
  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
}
