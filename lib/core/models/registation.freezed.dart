// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Registation _$RegistationFromJson(Map<String, dynamic> json) {
  return _Registation.fromJson(json);
}

/// @nodoc
mixin _$Registation {
  String? get id => throw _privateConstructorUsedError;
  String? get courseId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdDate => throw _privateConstructorUsedError;
  Course? get course => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegistationCopyWith<Registation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistationCopyWith<$Res> {
  factory $RegistationCopyWith(
          Registation value, $Res Function(Registation) then) =
      _$RegistationCopyWithImpl<$Res, Registation>;
  @useResult
  $Res call(
      {String? id,
      String? courseId,
      String? userId,
      String? status,
      @TimestampConverter() DateTime? createdDate,
      Course? course});

  $CourseCopyWith<$Res>? get course;
}

/// @nodoc
class _$RegistationCopyWithImpl<$Res, $Val extends Registation>
    implements $RegistationCopyWith<$Res> {
  _$RegistationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? courseId = freezed,
    Object? userId = freezed,
    Object? status = freezed,
    Object? createdDate = freezed,
    Object? course = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course?,
    ) as $Val);
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
abstract class _$$_RegistationCopyWith<$Res>
    implements $RegistationCopyWith<$Res> {
  factory _$$_RegistationCopyWith(
          _$_Registation value, $Res Function(_$_Registation) then) =
      __$$_RegistationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? courseId,
      String? userId,
      String? status,
      @TimestampConverter() DateTime? createdDate,
      Course? course});

  @override
  $CourseCopyWith<$Res>? get course;
}

/// @nodoc
class __$$_RegistationCopyWithImpl<$Res>
    extends _$RegistationCopyWithImpl<$Res, _$_Registation>
    implements _$$_RegistationCopyWith<$Res> {
  __$$_RegistationCopyWithImpl(
      _$_Registation _value, $Res Function(_$_Registation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? courseId = freezed,
    Object? userId = freezed,
    Object? status = freezed,
    Object? createdDate = freezed,
    Object? course = freezed,
  }) {
    return _then(_$_Registation(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      courseId: freezed == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Registation implements _Registation {
  const _$_Registation(
      {this.id,
      this.courseId,
      this.userId,
      this.status,
      @TimestampConverter() this.createdDate,
      this.course});

  factory _$_Registation.fromJson(Map<String, dynamic> json) =>
      _$$_RegistationFromJson(json);

  @override
  final String? id;
  @override
  final String? courseId;
  @override
  final String? userId;
  @override
  final String? status;
  @override
  @TimestampConverter()
  final DateTime? createdDate;
  @override
  final Course? course;

  @override
  String toString() {
    return 'Registation(id: $id, courseId: $courseId, userId: $userId, status: $status, createdDate: $createdDate, course: $course)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Registation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.course, course) || other.course == course));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, courseId, userId, status, createdDate, course);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegistationCopyWith<_$_Registation> get copyWith =>
      __$$_RegistationCopyWithImpl<_$_Registation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegistationToJson(
      this,
    );
  }
}

abstract class _Registation implements Registation {
  const factory _Registation(
      {final String? id,
      final String? courseId,
      final String? userId,
      final String? status,
      @TimestampConverter() final DateTime? createdDate,
      final Course? course}) = _$_Registation;

  factory _Registation.fromJson(Map<String, dynamic> json) =
      _$_Registation.fromJson;

  @override
  String? get id;
  @override
  String? get courseId;
  @override
  String? get userId;
  @override
  String? get status;
  @override
  @TimestampConverter()
  DateTime? get createdDate;
  @override
  Course? get course;
  @override
  @JsonKey(ignore: true)
  _$$_RegistationCopyWith<_$_Registation> get copyWith =>
      throw _privateConstructorUsedError;
}
