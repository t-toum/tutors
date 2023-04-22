import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/extensions/either_extension.dart';
import 'package:tutors/core/models/users.dart';
import 'package:tutors/core/usecases/no_params.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../../domain/usecases/get_current_user_usecase.dart';
import '../../domain/usecases/update_user_profile.dart';
import '../../domain/usecases/upload_image_usecase.dart';

part 'account_cubit.freezed.dart';
part 'account_state.dart';

@injectable
class AccountCubit extends Cubit<AccountState> {
  final GetCurrentUserUsecase _getCurrentUserUsecase;
  final ImagePicker _imagePicker;
  final UploadImageUsecase _uploadImageUsecase;
  final UpdateUserProfile _updateUserProfile;

  late GlobalKey<FormBuilderState> editInfoKey;
  late List<String> genders;
  AccountCubit(this._getCurrentUserUsecase, this._imagePicker,
      this._uploadImageUsecase, this._updateUserProfile)
      : super(const AccountState()) {
    editInfoKey = GlobalKey<FormBuilderState>();
    genders = [LocaleKeys.kMale.tr(), LocaleKeys.kFemale.tr()];
  }

  Future<void> getCurrentUser() async {
    emit(state.copyWith(status: DataStatus.loading));
    final user = await _getCurrentUserUsecase(NoParams());
    if (user.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: user.getLeft()?.msg));
    } else {
      emit(state.copyWith(
        status: DataStatus.success,
        currentUser: user.getRight(),
      ));
    }
  }

  Future<void> getImage(
      {required ImageSource imageSource,
      ImageType type = ImageType.none}) async {
    final pickedImage = await _imagePicker.pickImage(source: imageSource);
    if (pickedImage != null) {
      emit(state.copyWith(status: DataStatus.loading));
      File file = File(pickedImage.path);
      await uploadImage(file: file, type: type);
    }
  }

  //Upload image to firebase storage
  Future<void> uploadImage(
      {required File file, ImageType type = ImageType.none}) async {
    final result = await _uploadImageUsecase(UploadImageParams(
      file: file,
      ref: type.name,
    ));
    if (result.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: result.getLeft()?.msg));
    } else {
      String url = result.getRight() ?? '';
      if (type == ImageType.cover) {
        await _updateProfile(data: {
          "coverUrl": url,
        });
      } else if (type == ImageType.profile) {
        await _updateProfile(data: {
          "profileUrl": url,
        });
      }
    }
  }

  Future<void> updateUserInfo() async {
    if (editInfoKey.currentState!.saveAndValidate()) {
      emit(state.copyWith(status: DataStatus.loading));
      final Map<String, dynamic> formValue =
          editInfoKey.currentState?.value ?? {};
      await _updateProfile(data: formValue);
    }
  }

  //Update user
  Future<void> _updateProfile({required Map<String, dynamic> data}) async {
    final result = await _updateUserProfile(
        UpdateProfileParams(userID: state.currentUser?.id ?? '', data: data));
    if (result.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: result.getLeft()?.msg));
    } else {
      await getCurrentUser();
    }
  }
}
