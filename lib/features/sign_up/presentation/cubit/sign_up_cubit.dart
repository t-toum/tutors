import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/extensions/either_extension.dart';

import '../../../../core/navigator/app_navigator.dart';
import '../../../../core/routes/route_path.dart';
import '../../domain/usecases/sign_up_usecase.dart';
import '../../domain/usecases/update_user_role_usecase.dart';

part 'sign_up_cubit.freezed.dart';
part 'sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUsecase _signUpUsecase;
  final UpdateUserRoleUsecase _updateUserRoleUsecase;
  SignUpCubit(this._signUpUsecase, this._updateUserRoleUsecase)
      : super(const SignUpState());

  GlobalKey<FormBuilderState> signUpForm = GlobalKey<FormBuilderState>();

  Future<void> signUp() async {
    if (signUpForm.currentState!.saveAndValidate()) {
      emit(state.copyWith(status: DataStatus.loading));
      Map<String, dynamic> formValue = signUpForm.currentState?.value ?? {};
      final result = await _signUpUsecase(
        SignUpParams(
          name: formValue['name'],
          email: formValue['email'],
          password: formValue['password'],
        ),
      );
      result.fold((error) {
        emit(state.copyWith(status: DataStatus.failure, error: error.msg));
      }, (user) {
        AppNavigator.pushAndRemoveUntil(
          RoutePath.roleRoute,
          params: user.user?.uid,
        );
      });
    }
  }

  Future<void> updateUserRole(
      {required String doc, required String role}) async {
    emit(state.copyWith(status: DataStatus.loading));

    final result = await _updateUserRoleUsecase(
        UpdateUserRoleParams(doc: doc, data: {'role': role}));
    if (result.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: result.getLeft()?.msg));
    } else {
      AppNavigator.pushAndRemoveUntil(RoutePath.homeRoute);
    }
  }
}
