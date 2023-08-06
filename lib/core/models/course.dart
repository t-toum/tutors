import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tutors/core/models/users.dart';
import '../utils/json_coverter.dart';
part 'course.freezed.dart';
part 'course.g.dart';

@freezed
class Course with _$Course {
  const factory Course({
    final String? id,
    final String? userId,
    final String? title,
    final String? subject,
    final String? location,
    final String? category,
    @TimestampConverter()
    final DateTime? startDate,
    @TimestampConverter()
    final DateTime? endDate,
    final String? description,
    final Users? users,
    @TimestampConverter()
    final DateTime? createdDate,
    final String? imageUrl,
    @Default(false)
    final bool status,
    @Default(0)
    final int maximum,
  }) = _Course;
  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}
