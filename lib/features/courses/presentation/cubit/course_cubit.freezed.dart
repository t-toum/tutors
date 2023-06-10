// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CourseState {
  DataStatus get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  Users? get currentUser => throw _privateConstructorUsedError;
  bool get canReset => throw _privateConstructorUsedError;
  List<Course>? get listCourse => throw _privateConstructorUsedError;
  List<Course>? get allCourse => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CourseStateCopyWith<CourseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseStateCopyWith<$Res> {
  factory $CourseStateCopyWith(
          CourseState value, $Res Function(CourseState) then) =
      _$CourseStateCopyWithImpl<$Res, CourseState>;
  @useResult
  $Res call(
      {DataStatus status,
      String? error,
      Users? currentUser,
      bool canReset,
      List<Course>? listCourse,
      List<Course>? allCourse});

  $UsersCopyWith<$Res>? get currentUser;
}

/// @nodoc
class _$CourseStateCopyWithImpl<$Res, $Val extends CourseState>
    implements $CourseStateCopyWith<$Res> {
  _$CourseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? currentUser = freezed,
    Object? canReset = null,
    Object? listCourse = freezed,
    Object? allCourse = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      currentUser: freezed == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as Users?,
      canReset: null == canReset
          ? _value.canReset
          : canReset // ignore: cast_nullable_to_non_nullable
              as bool,
      listCourse: freezed == listCourse
          ? _value.listCourse
          : listCourse // ignore: cast_nullable_to_non_nullable
              as List<Course>?,
      allCourse: freezed == allCourse
          ? _value.allCourse
          : allCourse // ignore: cast_nullable_to_non_nullable
              as List<Course>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsersCopyWith<$Res>? get currentUser {
    if (_value.currentUser == null) {
      return null;
    }

    return $UsersCopyWith<$Res>(_value.currentUser!, (value) {
      return _then(_value.copyWith(currentUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $CourseStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStatus status,
      String? error,
      Users? currentUser,
      bool canReset,
      List<Course>? listCourse,
      List<Course>? allCourse});

  @override
  $UsersCopyWith<$Res>? get currentUser;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$CourseStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? currentUser = freezed,
    Object? canReset = null,
    Object? listCourse = freezed,
    Object? allCourse = freezed,
  }) {
    return _then(_$_Initial(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      currentUser: freezed == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as Users?,
      canReset: null == canReset
          ? _value.canReset
          : canReset // ignore: cast_nullable_to_non_nullable
              as bool,
      listCourse: freezed == listCourse
          ? _value._listCourse
          : listCourse // ignore: cast_nullable_to_non_nullable
              as List<Course>?,
      allCourse: freezed == allCourse
          ? _value._allCourse
          : allCourse // ignore: cast_nullable_to_non_nullable
              as List<Course>?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {this.status = DataStatus.initial,
      this.error,
      this.currentUser,
      this.canReset = false,
      final List<Course>? listCourse,
      final List<Course>? allCourse})
      : _listCourse = listCourse,
        _allCourse = allCourse;

  @override
  @JsonKey()
  final DataStatus status;
  @override
  final String? error;
  @override
  final Users? currentUser;
  @override
  @JsonKey()
  final bool canReset;
  final List<Course>? _listCourse;
  @override
  List<Course>? get listCourse {
    final value = _listCourse;
    if (value == null) return null;
    if (_listCourse is EqualUnmodifiableListView) return _listCourse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Course>? _allCourse;
  @override
  List<Course>? get allCourse {
    final value = _allCourse;
    if (value == null) return null;
    if (_allCourse is EqualUnmodifiableListView) return _allCourse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CourseState(status: $status, error: $error, currentUser: $currentUser, canReset: $canReset, listCourse: $listCourse, allCourse: $allCourse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(other.canReset, canReset) ||
                other.canReset == canReset) &&
            const DeepCollectionEquality()
                .equals(other._listCourse, _listCourse) &&
            const DeepCollectionEquality()
                .equals(other._allCourse, _allCourse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      error,
      currentUser,
      canReset,
      const DeepCollectionEquality().hash(_listCourse),
      const DeepCollectionEquality().hash(_allCourse));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements CourseState {
  const factory _Initial(
      {final DataStatus status,
      final String? error,
      final Users? currentUser,
      final bool canReset,
      final List<Course>? listCourse,
      final List<Course>? allCourse}) = _$_Initial;

  @override
  DataStatus get status;
  @override
  String? get error;
  @override
  Users? get currentUser;
  @override
  bool get canReset;
  @override
  List<Course>? get listCourse;
  @override
  List<Course>? get allCourse;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
