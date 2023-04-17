import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tutors/core/models/school.dart';
part 'education.freezed.dart';
part 'education.g.dart';

@freezed
class Education with _$Education {
  const factory Education({
    final String? id,
    final School? school,
    final String? grade,
    final String? fieldStudy,
    final DateTime? startDate,
    final DateTime? endDate,
    final String? acctivities,
    final String? description,
  }) = _Education;

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
}
