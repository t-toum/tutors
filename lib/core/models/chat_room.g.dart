// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatRoom _$$_ChatRoomFromJson(Map<String, dynamic> json) => _$_ChatRoom(
      id: json['id'] as String?,
      members:
          (json['members'] as List<dynamic>?)?.map((e) => e as String).toList(),
      receiver: json['receiver'] == null
          ? null
          : Users.fromJson(json['receiver'] as Map<String, dynamic>),
      createdDate: const TimestampConverter()
          .fromJson(json['createdDate'] as Timestamp?),
    );

Map<String, dynamic> _$$_ChatRoomToJson(_$_ChatRoom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'members': instance.members,
      'receiver': instance.receiver,
      'createdDate': const TimestampConverter().toJson(instance.createdDate),
    };
