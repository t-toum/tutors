// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Chat _$$_ChatFromJson(Map<String, dynamic> json) => _$_Chat(
      id: json['id'] as String?,
      receiverID: json['receiverID'] as String?,
      senderID: json['senderID'] as String?,
      receiver: json['receiver'] == null
          ? null
          : Users.fromJson(json['receiver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ChatToJson(_$_Chat instance) => <String, dynamic>{
      'id': instance.id,
      'receiverID': instance.receiverID,
      'senderID': instance.senderID,
      'receiver': instance.receiver,
    };
