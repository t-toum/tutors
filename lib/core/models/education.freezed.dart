// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'education.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Education _$EducationFromJson(Map<String, dynamic> json) {
  return _Education.fromJson(json);
}

/// @nodoc
mixin _$Education {
  String? get id => throw _privateConstructorUsedError;
  School? get school => throw _privateConstructorUsedError;
  String? get grade => throw _privateConstructorUsedError;
  String? get fieldStudy => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get startDate => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get endDate => throw _privateConstructorUsedError;
  String? get acctivities => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EducationCopyWith<Education> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationCopyWith<$Res> {
  factory $EducationCopyWith(Education value, $Res Function(Education) then) =
      _$EducationCopyWithImpl<$Res, Education>;
  @useResult
  $Res call(
      {String? id,
      School? school,
      String? grade,
      String? fieldStudy,
      @TimestampConverter() DateTime? startDate,
      @TimestampConverter() DateTime? endDate,
      String? acctivities,
      String? description});

  $SchoolCopyWith<$Res>? get school;
}

/// @nodoc
class _$EducationCopyWithImpl<$Res, $Val extends Education>
    implements $EducationCopyWith<$Res> {
  _$EducationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? school = freezed,
    Object? grade = freezed,
    Object? fieldStudy = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? acctivities = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      school: freezed == school
          ? _value.school
          : school // ignore: cast_nullable_to_non_nullable
              as School?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldStudy: freezed == fieldStudy
          ? _value.fieldStudy
          : fieldStudy // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      acctivities: freezed == acctivities
          ? _value.acctivities
          : acctivities // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SchoolCopyWith<$Res>? get school {
    if (_value.school == null) {
      return null;
    }

    return $SchoolCopyWith<$Res>(_value.school!, (value) {
      return _then(_value.copyWith(school: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EducationCopyWith<$Res> implements $EducationCopyWith<$Res> {
  factory _$$_EducationCopyWith(
          _$_Education value, $Res Function(_$_Education) then) =
      __$$_EducationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      School? school,
      String? grade,
      String? fieldStudy,
      @TimestampConverter() DateTime? startDate,
      @TimestampConverter() DateTime? endDate,
      String? acctivities,
      String? description});

  @override
  $SchoolCopyWith<$Res>? get school;
}

/// @nodoc
class __$$_EducationCopyWithImpl<$Res>
    extends _$EducationCopyWithImpl<$Res, _$_Education>
    implements _$$_EducationCopyWith<$Res> {
  __$$_EducationCopyWithImpl(
      _$_Education _value, $Res Function(_$_Education) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? school = freezed,
    Object? grade = freezed,
    Object? fieldStudy = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? acctivities = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_Education(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      school: freezed == school
          ? _value.school
          : school // ignore: cast_nullable_to_non_nullable
              as School?,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldStudy: freezed == fieldStudy
          ? _value.fieldStudy
          : fieldStudy // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      acctivities: freezed == acctivities
          ? _value.acctivities
          : acctivities // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Education implements _Education {
  const _$_Education(
      {this.id,
      this.school,
      this.grade,
      this.fieldStudy,
      @TimestampConverter() this.startDate,
      @TimestampConverter() this.endDate,
      this.acctivities,
      this.description});

  factory _$_Education.fromJson(Map<String, dynamic> json) =>
      _$$_EducationFromJson(json);

  @override
  final String? id;
  @override
  final School? school;
  @override
  final String? grade;
  @override
  final String? fieldStudy;
  @override
  @TimestampConverter()
  final DateTime? startDate;
  @override
  @TimestampConverter()
  final DateTime? endDate;
  @override
  final String? acctivities;
  @override
  final String? description;

  @override
  String toString() {
    return 'Education(id: $id, school: $school, grade: $grade, fieldStudy: $fieldStudy, startDate: $startDate, endDate: $endDate, acctivities: $acctivities, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Education &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.school, school) || other.school == school) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.fieldStudy, fieldStudy) ||
                other.fieldStudy == fieldStudy) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.acctivities, acctivities) ||
                other.acctivities == acctivities) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, school, grade, fieldStudy,
      startDate, endDate, acctivities, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EducationCopyWith<_$_Education> get copyWith =>
      __$$_EducationCopyWithImpl<_$_Education>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EducationToJson(
      this,
    );
  }
}

abstract class _Education implements Education {
  const factory _Education(
      {final String? id,
      final School? school,
      final String? grade,
      final String? fieldStudy,
      @TimestampConverter() final DateTime? startDate,
      @TimestampConverter() final DateTime? endDate,
      final String? acctivities,
      final String? description}) = _$_Education;

  factory _Education.fromJson(Map<String, dynamic> json) =
      _$_Education.fromJson;

  @override
  String? get id;
  @override
  School? get school;
  @override
  String? get grade;
  @override
  String? get fieldStudy;
  @override
  @TimestampConverter()
  DateTime? get startDate;
  @override
  @TimestampConverter()
  DateTime? get endDate;
  @override
  String? get acctivities;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_EducationCopyWith<_$_Education> get copyWith =>
      throw _privateConstructorUsedError;
}
