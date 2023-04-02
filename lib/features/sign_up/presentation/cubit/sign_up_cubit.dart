import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/app_constants.dart';

import '../../domain/usecases/sign_up_usecase.dart';

part 'sign_up_cubit.freezed.dart';
part 'sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUsecase signUpUsecase;
  SignUpCubit(this.signUpUsecase) : super(const SignUpState());

  GlobalKey<FormBuilderState> signUpForm = GlobalKey<FormBuilderState>();

  Future<void> signUp() async {
    if (signUpForm.currentState!.saveAndValidate()) {
      Map<String, dynamic> formValue = signUpForm.currentState?.value ?? {};
      final result = await signUpUsecase(
        SignUpParams(
          name: formValue['name'],
          email: formValue['email'],
          password: formValue['password'],
        ),
      );
      result.fold((error) {
        emit(state.copyWith(status: DataStatus.failure, error: error.msg));
      }, (user) {
        emit(state.copyWith(status: DataStatus.success));
      });
    }
  }
}
