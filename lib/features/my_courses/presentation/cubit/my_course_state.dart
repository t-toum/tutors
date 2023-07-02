part of 'my_course_cubit.dart';

@freezed
class MyCourseState with _$MyCourseState {
  const factory MyCourseState({
    @Default(DataStatus.initial)
    DataStatus status,
    String? error,
    Users? currentUser,
    List<Registation>? myCourses,
  })= _Initial;
}
