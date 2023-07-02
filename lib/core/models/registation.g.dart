// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Registation _$$_RegistationFromJson(Map<String, dynamic> json) =>
    _$_Registation(
      id: json['id'] as String?,
      courseId: json['courseId'] as String?,
      userId: json['userId'] as String?,
      status: json['status'] as String?,
      createdDate: const TimestampConverter()
          .fromJson(json['createdDate'] as Timestamp?),
      course: json['course'] == null
          ? null
          : Course.fromJson(json['course'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RegistationToJson(_$_Registation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'userId': instance.userId,
      'status': instance.status,
      'createdDate': const TimestampConverter().toJson(instance.createdDate),
      'course': instance.course,
    };
