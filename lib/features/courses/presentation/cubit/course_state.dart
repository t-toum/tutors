part of 'course_cubit.dart';

@freezed
class CourseState with _$CourseState {
  const factory CourseState({
    @Default(DataStatus.initial)
    final DataStatus status,
    final String? error,
    @Default(false)
    final bool canReset,
  }) = _Initial;
}
