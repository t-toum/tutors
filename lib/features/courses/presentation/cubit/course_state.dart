part of 'course_cubit.dart';

@freezed
class CourseState with _$CourseState {
  const factory CourseState({
    @Default(DataStatus.initial)
    final DataStatus status,
    final String? error,
    final Users? currentUser,
    @Default(false)
    final bool canReset,
    List<Course>? listCourse,
    List<Course>? allCourse,
    List<Category>? categories,
    @Default(false)
    bool isRegistered,
    @Default(false)
    bool registered,
  }) = _Initial;
}
