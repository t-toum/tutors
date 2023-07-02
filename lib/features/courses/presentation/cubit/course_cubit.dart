import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/constants/enumerics.dart';
import 'package:tutors/core/extensions/date_time_extension.dart';
import 'package:tutors/core/extensions/either_extension.dart';
import 'package:tutors/core/extensions/string_extension.dart';
import 'package:tutors/core/models/course.dart';
import 'package:tutors/core/models/registation.dart';
import 'package:tutors/core/models/users.dart';
import 'package:tutors/core/navigator/app_navigator.dart';

import '../../../../core/models/category.dart';
import '../../../../core/usecases/no_params.dart';
import '../../../home/domain/usecases/get_current_user_usecase.dart';
import '../../../my_courses/domain/usecases/get_registered_course_usecase.dart';
import '../../domain/usecases/add_course_usecase.dart';
import '../../domain/usecases/get_all_course_usecase.dart';
import '../../domain/usecases/get_categories_usecase.dart';
import '../../domain/usecases/register_usecase.dart';

part 'course_cubit.freezed.dart';
part 'course_state.dart';

@injectable
class CourseCubit extends Cubit<CourseState> {
  final GetCurrentUserDataUsecase _getCurrentUserDataUsecase;
  final AddCourseUsecase _addCourseUsecase;
  final GetAllCourseUsecase _getAllCourseUsecase;
  final GetCategoriesUsecase _getCategoriesUsecase;
  final RegisterUsecase _registerUsecase;
  final GetRegisteredCourseUsecase _getRegisteredCourseUsecase;

  late TextEditingController searchTextController;
  late GlobalKey<FormBuilderState> generalKey;
  CourseCubit(
    this._getCurrentUserDataUsecase,
    this._addCourseUsecase,
    this._getAllCourseUsecase,
    this._getCategoriesUsecase,
    this._registerUsecase,
    this._getRegisteredCourseUsecase,
  ) : super(const CourseState()) {
    searchTextController = TextEditingController();
    generalKey = GlobalKey<FormBuilderState>();

    searchTextController.addListener(() {
      List<Course>? searchList;
      if (searchTextController.text.isNotEmpty) {
        searchList = state.allCourse?.where((course) {
              return course.title.containsWithNull(searchTextController.text) ||
                  course.category.containsWithNull(searchTextController.text);
            }).toList() ??
            [];
      } else {
        searchList = state.allCourse;
      }
      emit(state.copyWith(
        listCourse: searchList,
        canReset: searchTextController.text.isNotEmpty,
      ));
    });
  }

  Future<void> getCategories() async {
    final categories = await _getCategoriesUsecase(NoParams());
    if (categories.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: categories.getLeft()?.msg));
    } else {
      final sortData = categories.getRight();
      sortData?.sort((a, b) => b.name.compareToWithNull(a.name));
      emit(state.copyWith(categories: sortData));
    }
  }

  void onResetSearchTextfield() {
    searchTextController.clear();
  }

  Future<void> getCurrentUser() async {
    emit(state.copyWith(status: DataStatus.loading));
    final user = await _getCurrentUserDataUsecase(NoParams());
    if (user.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: user.getLeft()?.msg));
    } else {
      emit(state.copyWith(
          status: DataStatus.success, currentUser: user.getRight()));
    }
  }

  Future<void> onSaveCourse() async {
    if (generalKey.currentState!.saveAndValidate()) {
      emit(state.copyWith(status: DataStatus.loading));
      Map<String, dynamic> formValue =
          Map.from(generalKey.currentState?.value ?? {});
      formValue["userId"] = state.currentUser?.id;
      Course data = Course.fromJson(formValue);
      data = data.copyWith(createdDate: DateTime.now());
      final result = await _addCourseUsecase(data);
      if (result.isLeft()) {
        emit(
          state.copyWith(
            status: DataStatus.failure,
            error: result.getLeft()?.msg,
          ),
        );
      } else {
        emit(state.copyWith(status: DataStatus.success));
        AppNavigator.goBackWithData(data: true);
      }
    } else {
      print("Add course validated");
    }
  }

  Future<void> getAllCourse() async {
    emit(state.copyWith(status: DataStatus.loading));
    final result = await _getAllCourseUsecase(NoParams());
    if (result.isLeft()) {
      emit(
        state.copyWith(
          status: DataStatus.failure,
          error: result.getLeft()?.msg,
        ),
      );
    } else {
      final data = result.getRight();
      data?.sort((a, b) => b.createdDate.compareToWithNull(a.createdDate));
      emit(
        state.copyWith(
            status: DataStatus.success, listCourse: data, allCourse: data),
      );
    }
  }

  Future<void> filterCourse() async {}

  Future<void> getRegisteredCourse({required String courseId}) async {
    final result = await _getRegisteredCourseUsecase(state.currentUser?.id);
    if (result.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: result.getLeft()?.msg));
    } else {
      final registeredData = result
          .getRight()
          ?.where((element) => element.courseId == courseId)
          .toList();
      emit(state.copyWith(
          isRegistered: registeredData?.isNotEmpty ?? false));
    }
  }

  Future<void> register({required String couresId}) async {
    emit(state.copyWith(status: DataStatus.loading));
    Registation data = Registation(
      userId: state.currentUser?.id,
      courseId: couresId,
      status: RegisterStatus.pending.name,
      createdDate: DateTime.now(),
    );
    final result = await _registerUsecase(data);
    if (result.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: result.getLeft()?.msg));
    } else {
      emit(state.copyWith(status: DataStatus.success, registered: true));
    }
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
