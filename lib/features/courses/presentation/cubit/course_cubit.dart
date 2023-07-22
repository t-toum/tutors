import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/constants/enumerics.dart';
import 'package:tutors/core/extensions/date_time_extension.dart';
import 'package:tutors/core/extensions/either_extension.dart';
import 'package:tutors/core/extensions/string_extension.dart';
import 'package:tutors/core/models/course.dart';
import 'package:tutors/core/models/favorite.dart';
import 'package:tutors/core/models/registation.dart';
import 'package:tutors/core/models/users.dart';
import 'package:tutors/core/navigator/app_navigator.dart';

import '../../../../core/models/category.dart';
import '../../../../core/usecases/no_params.dart';
import '../../../account/domain/usecases/upload_image_usecase.dart';
import '../../../favorites/domain/usecases/add_favorite_usecase.dart';
import '../../../favorites/domain/usecases/get_favorite_usecase.dart';
import '../../../favorites/domain/usecases/remove_favorite_usecase.dart';
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
  final ImagePicker _imagePicker;
  final UploadImageUsecase _uploadImageUsecase;
  final AddFavoriteUsecase _addFavoriteUsecase;
  final GetFavoriteUsecase _getFavoriteUsecase;
  final RemoveFavoriteUsecase _removeFavoriteUsecase;

  late TextEditingController searchTextController;
  late GlobalKey<FormBuilderState> generalKey;
  late CroppedFile croppedFile;
  CourseCubit(
    this._getCurrentUserDataUsecase,
    this._addCourseUsecase,
    this._getAllCourseUsecase,
    this._getCategoriesUsecase,
    this._registerUsecase,
    this._getRegisteredCourseUsecase,
    this._imagePicker,
    this._uploadImageUsecase,
    this._addFavoriteUsecase,
    this._getFavoriteUsecase,
    this._removeFavoriteUsecase,
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
      await getFavorite();
    }
  }

  Future<void> onSaveCourse() async {
    if (generalKey.currentState!.saveAndValidate()) {
      emit(state.copyWith(status: DataStatus.loading));
      String? imageUrl;
      Map<String, dynamic> formValue =
          Map.from(generalKey.currentState?.value ?? {});
      formValue["userId"] = state.currentUser?.id;
      if (state.imageFile != null) {
        imageUrl =
            await uploadImage(file: state.imageFile!, type: ImageType.course);
      }
      Course data = Course.fromJson(formValue);
      data = data.copyWith(
        createdDate: DateTime.now(),
        status: true,
        imageUrl: imageUrl,
      );
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

  //Upload image to firebase storage
  Future<String?> uploadImage(
      {required File file, ImageType type = ImageType.none}) async {
    final result = await _uploadImageUsecase(UploadImageParams(
      file: file,
      ref: type.name,
    ));
    return result.getRight();
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
      if (super.isClosed) return;
      emit(
        state.copyWith(
            status: DataStatus.success, listCourse: data, allCourse: data),
      );
    }
  }

  Future<void> filterCourse() async {}

  Future<void> getImage({required ImageSource source}) async {
    final pickedFile = await _imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      final path = await cropImage(pickedFile.path);
      if (path != null) {
        File file = File(path);
        emit(state.copyWith(imageFile: file));
      }
    }
  }

  Future<String?> cropImage(String path) async {
    CroppedFile? croppedFile =
        await ImageCropper().cropImage(sourcePath: path, aspectRatioPresets: [
      CropAspectRatioPreset.ratio16x9
    ], uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      IOSUiSettings(
        title: 'Cropper',
      ),
    ]);
    return croppedFile?.path;
  }

  void removeImage() {
    emit(state.copyWith(imageFile: null));
  }

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
      emit(state.copyWith(isRegistered: registeredData?.isNotEmpty ?? false));
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

  Future<void> addFavorite({required String courseId}) async {
    Favorite favorite = Favorite(
        userId: state.currentUser?.id,
        courseId: courseId,
        createdDate: DateTime.now());
    final result = await _addFavoriteUsecase(favorite);
    if (result.isLeft()) {
      emit(
        state.copyWith(
          status: DataStatus.failure,
          error: result.getLeft()?.msg,
        ),
      );
    } else {
      await getFavorite();
    }
  }

  Future<void> removeFavorite({required String id}) async {
    final result = await _removeFavoriteUsecase(id);
    if (result.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: result.getLeft()?.msg));
    } else {
      await getFavorite();
    }
  }

  Future<void> getFavorite() async {
    emit(state.copyWith(status: DataStatus.loading));
    final result = await _getFavoriteUsecase(state.currentUser?.id ?? '');
    if (result.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: result.getLeft()?.msg));
    } else {
      emit(state.copyWith(
          status: DataStatus.success, listFavorite: result.getRight()));
    }
  }

  bool isFvorite(String courseId) {
    return state.listFavorite
            ?.where((element) => element.courseId == courseId)
            .isNotEmpty ==
        true;
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
