// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Users _$$_UsersFromJson(Map<String, dynamic> json) => _$_Users(
      id: json['id'] as String?,
      username: json['username'] as String?,
      role: json['role'] as String?,
      email: json['email'] as String?,
      tel: json['tel'] as String?,
      profileUrl: json['profileUrl'] as String?,
      coverUrl: json['coverUrl'] as String?,
      jobTitle: json['jobTitle'] as String?,
      position: json['position'] as String?,
      industry: json['industry'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      education: (json['education'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      experience: (json['experience'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      skills:
          (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_UsersToJson(_$_Users instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'role': instance.role,
      'email': instance.email,
      'tel': instance.tel,
      'profileUrl': instance.profileUrl,
      'coverUrl': instance.coverUrl,
      'jobTitle': instance.jobTitle,
      'position': instance.position,
      'industry': instance.industry,
      'country': instance.country,
      'city': instance.city,
      'education': instance.education,
      'experience': instance.experience,
      'skills': instance.skills,
    };
