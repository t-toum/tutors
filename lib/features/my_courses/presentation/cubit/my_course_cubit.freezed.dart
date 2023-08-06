// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_course_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyCourseState {
  DataStatus get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  Users? get currentUser => throw _privateConstructorUsedError;
  List<Registation>? get myCourses => throw _privateConstructorUsedError;
  List<Course>? get listCourse => throw _privateConstructorUsedError;
  Course? get course => throw _privateConstructorUsedError;
  List<Registation>? get register => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyCourseStateCopyWith<MyCourseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyCourseStateCopyWith<$Res> {
  factory $MyCourseStateCopyWith(
          MyCourseState value, $Res Function(MyCourseState) then) =
      _$MyCourseStateCopyWithImpl<$Res, MyCourseState>;
  @useResult
  $Res call(
      {DataStatus status,
      String? error,
      Users? currentUser,
      List<Registation>? myCourses,
      List<Course>? listCourse,
      Course? course,
      List<Registation>? register});

  $UsersCopyWith<$Res>? get currentUser;
  $CourseCopyWith<$Res>? get course;
}

/// @nodoc
class _$MyCourseStateCopyWithImpl<$Res, $Val extends MyCourseState>
    implements $MyCourseStateCopyWith<$Res> {
  _$MyCourseStateCopyWithImpl(this._value, this._then);

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
    Object? myCourses = freezed,
    Object? listCourse = freezed,
    Object? course = freezed,
    Object? register = freezed,
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
      myCourses: freezed == myCourses
          ? _value.myCourses
          : myCourses // ignore: cast_nullable_to_non_nullable
              as List<Registation>?,
      listCourse: freezed == listCourse
          ? _value.listCourse
          : listCourse // ignore: cast_nullable_to_non_nullable
              as List<Course>?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course?,
      register: freezed == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as List<Registation>?,
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
abstract class _$$_InitialCopyWith<$Res>
    implements $MyCourseStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStatus status,
      String? error,
      Users? currentUser,
      List<Registation>? myCourses,
      List<Course>? listCourse,
      Course? course,
      List<Registation>? register});

  @override
  $UsersCopyWith<$Res>? get currentUser;
  @override
  $CourseCopyWith<$Res>? get course;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$MyCourseStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
    Object? currentUser = freezed,
    Object? myCourses = freezed,
    Object? listCourse = freezed,
    Object? course = freezed,
    Object? register = freezed,
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
      myCourses: freezed == myCourses
          ? _value._myCourses
          : myCourses // ignore: cast_nullable_to_non_nullable
              as List<Registation>?,
      listCourse: freezed == listCourse
          ? _value._listCourse
          : listCourse // ignore: cast_nullable_to_non_nullable
              as List<Course>?,
      course: freezed == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course?,
      register: freezed == register
          ? _value._register
          : register // ignore: cast_nullable_to_non_nullable
              as List<Registation>?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {this.status = DataStatus.initial,
      this.error,
      this.currentUser,
      final List<Registation>? myCourses,
      final List<Course>? listCourse,
      this.course,
      final List<Registation>? register})
      : _myCourses = myCourses,
        _listCourse = listCourse,
        _register = register;

  @override
  @JsonKey()
  final DataStatus status;
  @override
  final String? error;
  @override
  final Users? currentUser;
  final List<Registation>? _myCourses;
  @override
  List<Registation>? get myCourses {
    final value = _myCourses;
    if (value == null) return null;
    if (_myCourses is EqualUnmodifiableListView) return _myCourses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Course>? _listCourse;
  @override
  List<Course>? get listCourse {
    final value = _listCourse;
    if (value == null) return null;
    if (_listCourse is EqualUnmodifiableListView) return _listCourse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Course? course;
  final List<Registation>? _register;
  @override
  List<Registation>? get register {
    final value = _register;
    if (value == null) return null;
    if (_register is EqualUnmodifiableListView) return _register;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MyCourseState(status: $status, error: $error, currentUser: $currentUser, myCourses: $myCourses, listCourse: $listCourse, course: $course, register: $register)';
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
            const DeepCollectionEquality()
                .equals(other._myCourses, _myCourses) &&
            const DeepCollectionEquality()
                .equals(other._listCourse, _listCourse) &&
            (identical(other.course, course) || other.course == course) &&
            const DeepCollectionEquality().equals(other._register, _register));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      error,
      currentUser,
      const DeepCollectionEquality().hash(_myCourses),
      const DeepCollectionEquality().hash(_listCourse),
      course,
      const DeepCollectionEquality().hash(_register));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements MyCourseState {
  const factory _Initial(
      {final DataStatus status,
      final String? error,
      final Users? currentUser,
      final List<Registation>? myCourses,
      final List<Course>? listCourse,
      final Course? course,
      final List<Registation>? register}) = _$_Initial;

  @override
  DataStatus get status;
  @override
  String? get error;
  @override
  Users? get currentUser;
  @override
  List<Registation>? get myCourses;
  @override
  List<Course>? get listCourse;
  @override
  Course? get course;
  @override
  List<Registation>? get register;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
