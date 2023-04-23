import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/json_coverter.dart';
part 'experience.freezed.dart';
part 'experience.g.dart';
@freezed
class Experience with _$Experience {
  const factory Experience({
    final String? id,
    final String? title,
    final String? type,
    final String? company,
    final String? location,
    final String? locationType,
    final bool? isPresent,
    @TimestampConverter()
    final DateTime? startDate,
    @TimestampConverter()
    final DateTime? endDate,
    final String? description,
    final String? imageUrl,
  }) = _Experience;

  factory Experience.fromJson(Map<String,dynamic>json)=>_$ExperienceFromJson(json);

}