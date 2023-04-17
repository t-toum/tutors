import 'package:freezed_annotation/freezed_annotation.dart';
part 'school.freezed.dart';
part 'school.g.dart';
@freezed
class School with _$School{
  const factory School({
    final String? id,
    final String? name,
    final String? imageUrl,
    final String? description,
  })=_School;
  factory School.fromJson(Map<String,dynamic>json)=>_$SchoolFromJson(json);
}