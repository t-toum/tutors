import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/core/routes/route_path.dart';

import '../../domain/usecases/sign_in_usecase.dart';

part 'sign_in_cubit.freezed.dart';
part 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final SignInUsecase _signInUsecase;
  SignInCubit(this._signInUsecase) : super(const SignInState());
  GlobalKey<FormBuilderState> signInForm = GlobalKey<FormBuilderState>();

  Future<void> signIn() async {
    if (signInForm.currentState!.saveAndValidate()) {
      emit(state.copyWith(status: DataStatus.loading));
      Map<String, dynamic> formValue = signInForm.currentState?.value ?? {};
      final result = await _signInUsecase(
        SignInParams(
            email: formValue['email'], password: formValue['password']),
      );
      result.fold((error) {
        emit(state.copyWith(
          status: DataStatus.failure,
          error: error.msg ?? '',
        ));
      }, (user) {
        AppNavigator.pushAndRemoveUntil(RoutePath.homeRoute);
      });
    }
  }
}
