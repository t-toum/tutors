import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/app_constants.dart';

import '../../../home/domain/usecases/get_current_user_usecase.dart';

part 'course_cubit.freezed.dart';
part 'course_state.dart';

@injectable
class CourseCubit extends Cubit<CourseState> {
  final GetCurrentUserDataUsecase getCurrentUserDataUsecase;
  late TextEditingController searchTextController;

  CourseCubit(this.getCurrentUserDataUsecase) : super(const CourseState()) {
    searchTextController = TextEditingController();

    searchTextController.addListener(() {
      emit(state.copyWith(canReset: searchTextController.text.isNotEmpty));
    });
  }

  void onResetSearchTextfield() {
    searchTextController.clear();
  }

  @override
  Future<void> close() {
    searchTextController.removeListener(() {
      onResetSearchTextfield();
    });
    searchTextController.dispose();
    return super.close();
  }
}
