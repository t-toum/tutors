import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TimestampConverter implements JsonConverter<DateTime?, Timestamp?> {
  const TimestampConverter();

  @override
  DateTime? fromJson(Timestamp? json) {
    if (json != null) {
      DateTime? dateTime =
          DateTime.fromMicrosecondsSinceEpoch(json.microsecondsSinceEpoch);
      return dateTime;
    } else {
      return null;
    }
  }

  @override
  Timestamp? toJson(DateTime? object) {
    if (object != null) {
      return Timestamp.fromDate(object);
    } else {
      return null;
    }
  }
}
