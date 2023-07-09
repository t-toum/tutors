// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Course _$$_CourseFromJson(Map<String, dynamic> json) => _$_Course(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      title: json['title'] as String?,
      subject: json['subject'] as String?,
      location: json['location'] as String?,
      category: json['category'] as String?,
      startDate:
          const TimestampConverter().fromJson(json['startDate'] as Timestamp?),
      endDate:
          const TimestampConverter().fromJson(json['endDate'] as Timestamp?),
      description: json['description'] as String?,
      users: json['users'] == null
          ? null
          : Users.fromJson(json['users'] as Map<String, dynamic>),
      createdDate: const TimestampConverter()
          .fromJson(json['createdDate'] as Timestamp?),
      imageUrl: json['imageUrl'] as String?,
      status: json['status'] as bool? ?? false,
    );

Map<String, dynamic> _$$_CourseToJson(_$_Course instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'subject': instance.subject,
      'location': instance.location,
      'category': instance.category,
      'startDate': const TimestampConverter().toJson(instance.startDate),
      'endDate': const TimestampConverter().toJson(instance.endDate),
      'description': instance.description,
      'users': instance.users,
      'createdDate': const TimestampConverter().toJson(instance.createdDate),
      'imageUrl': instance.imageUrl,
      'status': instance.status,
    };
