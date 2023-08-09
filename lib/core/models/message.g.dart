// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      roomId: json['roomId'] as String?,
      senderID: json['senderID'] as String?,
      receiverID: json['receiverID'] as String?,
      createdDate: const TimestampConverter()
          .fromJson(json['createdDate'] as Timestamp?),
      message: json['message'] as String?,
      receiver: json['receiver'] == null
          ? null
          : Users.fromJson(json['receiver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'senderID': instance.senderID,
      'receiverID': instance.receiverID,
      'createdDate': const TimestampConverter().toJson(instance.createdDate),
      'message': instance.message,
      'receiver': instance.receiver,
    };
