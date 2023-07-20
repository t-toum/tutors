import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tutors/core/models/course.dart';
import 'package:tutors/core/models/users.dart';
import '../utils/json_coverter.dart';
part 'favorite.freezed.dart';
part 'favorite.g.dart';

@freezed
class Favorite with _$Favorite {
  const factory Favorite({
     String? id,
     String? userId,
     Users? users,
     String? courseId,
     Course? course,
    @TimestampConverter()
    createdDate,
  }) = _Favorite;
  factory Favorite.fromJson(Map<String, dynamic> json) =>
      _$FavoriteFromJson(json);
}
