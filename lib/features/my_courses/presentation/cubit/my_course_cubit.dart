import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/extensions/either_extension.dart';
import 'package:tutors/core/models/registation.dart';
import 'package:tutors/core/usecases/no_params.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/models/course.dart';
import '../../../../core/models/users.dart';
import '../../../home/domain/usecases/get_current_user_usecase.dart';
import '../../domain/usecases/get_registered_course_usecase.dart';

part 'my_course_state.dart';
part 'my_course_cubit.freezed.dart';

@injectable
class MyCourseCubit extends Cubit<MyCourseState> {
  final GetRegisteredCourseUsecase _getRegisteredCourseUsecase;
  final GetCurrentUserDataUsecase _getCurrentUserDataUsecase;
  MyCourseCubit(
    this._getRegisteredCourseUsecase,
    this._getCurrentUserDataUsecase,
  ) : super(const MyCourseState());
  Future<void> getCurrentUser() async {
    emit(state.copyWith(status: DataStatus.loading));
    final result = await _getCurrentUserDataUsecase(NoParams());
    if (result.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: result.getLeft()?.msg));
    } else {
      emit(state.copyWith(
        status: DataStatus.success,
        currentUser: result.getRight(),
      ));
      await getRegisteredCourse();
    }
  }

  Future<void> getRegisteredCourse() async {
    emit(state.copyWith(status: DataStatus.loading));
    final result = await _getRegisteredCourseUsecase(state.currentUser?.id);
    if (result.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: result.getLeft()?.msg));
    } else {
      final registeredCourse = result.getRight();
      emit(
        state.copyWith(
          status: DataStatus.success,
          myCourses: registeredCourse,
        ),
      );
    }
  }
}
