// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Favorite _$FavoriteFromJson(Map<String, dynamic> json) {
  return _Favorite.fromJson(json);
}

/// @nodoc
mixin _$Favorite {
  String? get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  Users? get users => throw _privateConstructorUsedError;
  String? get courseId => throw _privateConstructorUsedError;
  Course? get course => throw _privateConstructorUsedError;
  @TimestampConverter()
  dynamic get createdDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteCopyWith<Favorite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteCopyWith<$Res> {
  factory $FavoriteCopyWith(Favorite value, $Res Function(Favorite) then) =
      _$FavoriteCopyWithImpl<$Res, Favorite>;
  @useResult
  $Res call(
      {String? id,
      String? userId,
      Users? users,
      String? courseId,
      Course? course,
      @TimestampConverter() dynamic createdDate});

  $UsersCopyWith<$Res>? get users;
  $CourseCopyWith<$Res>? get course;
}

/// @nodoc
class _$FavoriteCopyWithImpl<$Res, $Val extends Favorite>
    implements $FavoriteCopyWith<$Res> {
  _$FavoriteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? users = freezed,
    Object? courseId = freezed,
    Object? course = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Users?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsersCopyWith<$Res>? get users {
    if (_value.users == null) {
      return null;
    }

    return $UsersCopyWith<$Res>(_value.users!, (value) {
      return _then(_value.copyWith(users: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CourseCopyWith<$Res>? get course {
    if (_value.course == null) {
      return null;
    }

    return $CourseCopyWith<$Res>(_value.course!, (value) {
      return _then(_value.copyWith(course: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FavoriteCopyWith<$Res> implements $FavoriteCopyWith<$Res> {
  factory _$$_FavoriteCopyWith(
          _$_Favorite value, $Res Function(_$_Favorite) then) =
      __$$_FavoriteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? userId,
      Users? users,
      String? courseId,
      Course? course,
      @TimestampConverter() dynamic createdDate});

  @override
  $UsersCopyWith<$Res>? get users;
  @override
  $CourseCopyWith<$Res>? get course;
}

/// @nodoc
class __$$_FavoriteCopyWithImpl<$Res>
    extends _$FavoriteCopyWithImpl<$Res, _$_Favorite>
    implements _$$_FavoriteCopyWith<$Res> {
  __$$_FavoriteCopyWithImpl(
      _$_Favorite _value, $Res Function(_$_Favorite) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? users = freezed,
    Object? courseId = freezed,
    Object? course = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_$_Favorite(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Users?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course?,
      createdDate: freezed == createdDate ? _value.createdDate! : createdDate,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Favorite implements _Favorite {
  const _$_Favorite(
      {this.id,
      this.userId,
      this.users,
      this.courseId,
      this.course,
      @TimestampConverter() this.createdDate});

  factory _$_Favorite.fromJson(Map<String, dynamic> json) =>
      _$$_FavoriteFromJson(json);

  @override
  final String? id;
  @override
  final String? userId;
  @override
  final Users? users;
  @override
  final String? courseId;
  @override
  final Course? course;
  @override
  @TimestampConverter()
  final dynamic createdDate;

  @override
  String toString() {
    return 'Favorite(id: $id, userId: $userId, users: $users, courseId: $courseId, course: $course, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Favorite &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.users, users) || other.users == users) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.course, course) || other.course == course) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, users, courseId,
      course, const DeepCollectionEquality().hash(createdDate));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteCopyWith<_$_Favorite> get copyWith =>
      __$$_FavoriteCopyWithImpl<_$_Favorite>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FavoriteToJson(
      this,
    );
  }
}

abstract class _Favorite implements Favorite {
  const factory _Favorite(
      {final String? id,
      final String? userId,
      final Users? users,
      final String? courseId,
      final Course? course,
      @TimestampConverter() final dynamic createdDate}) = _$_Favorite;

  factory _Favorite.fromJson(Map<String, dynamic> json) = _$_Favorite.fromJson;

  @override
  String? get id;
  @override
  String? get userId;
  @override
  Users? get users;
  @override
  String? get courseId;
  @override
  Course? get course;
  @override
  @TimestampConverter()
  dynamic get createdDate;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteCopyWith<_$_Favorite> get copyWith =>
      throw _privateConstructorUsedError;
}
