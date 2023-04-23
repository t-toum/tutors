// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Experience _$$_ExperienceFromJson(Map<String, dynamic> json) =>
    _$_Experience(
      id: json['id'] as String?,
      title: json['title'] as String?,
      type: json['type'] as String?,
      company: json['company'] as String?,
      location: json['location'] as String?,
      locationType: json['locationType'] as String?,
      isPresent: json['isPresent'] as bool?,
      startDate:
          const TimestampConverter().fromJson(json['startDate'] as Timestamp?),
      endDate:
          const TimestampConverter().fromJson(json['endDate'] as Timestamp?),
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$_ExperienceToJson(_$_Experience instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'company': instance.company,
      'location': instance.location,
      'locationType': instance.locationType,
      'isPresent': instance.isPresent,
      'startDate': const TimestampConverter().toJson(instance.startDate),
      'endDate': const TimestampConverter().toJson(instance.endDate),
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };
