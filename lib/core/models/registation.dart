import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tutors/core/models/course.dart';
import '../utils/json_coverter.dart';
part 'registation.freezed.dart';
part 'registation.g.dart';
@freezed
class Registation with _$Registation {
  const factory Registation({
    final String? id,
    final String? courseId,
    final String? userId,
    final String? status,
    @TimestampConverter() final DateTime? createdDate,
    final Course? course,
  }) = _Registation;

  factory Registation.fromJson(Map<String, dynamic> json) =>
      _$RegistationFromJson(json);
}
