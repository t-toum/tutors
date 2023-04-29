// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Education _$$_EducationFromJson(Map<String, dynamic> json) => _$_Education(
      id: json['id'] as String?,
      school: json['school'] as String?,
      grade: json['grade'] as String?,
      degree: json['degree'] as String?,
      fieldStudy: json['fieldStudy'] as String?,
      startDate:
          const TimestampConverter().fromJson(json['startDate'] as Timestamp?),
      endDate:
          const TimestampConverter().fromJson(json['endDate'] as Timestamp?),
      acctivities: json['acctivities'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$_EducationToJson(_$_Education instance) =>
    <String, dynamic>{
      'id': instance.id,
      'school': instance.school,
      'grade': instance.grade,
      'degree': instance.degree,
      'fieldStudy': instance.fieldStudy,
      'startDate': const TimestampConverter().toJson(instance.startDate),
      'endDate': const TimestampConverter().toJson(instance.endDate),
      'acctivities': instance.acctivities,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };
