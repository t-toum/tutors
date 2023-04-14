import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/extensions/either_extension.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/core/routes/route_path.dart';

import '../../../app/domain/usecases/get_current_user_usecase.dart';
import '../../domain/usecases/sign_in_usecase.dart';

part 'sign_in_cubit.freezed.dart';
part 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final SignInUsecase _signInUsecase;
  final GetCurrentUserUsecase _getCurrentUserUsecase;
  SignInCubit(this._signInUsecase, this._getCurrentUserUsecase)
      : super(const SignInState());
  GlobalKey<FormBuilderState> signInForm = GlobalKey<FormBuilderState>();

  Future<void> signIn() async {
    if (signInForm.currentState!.saveAndValidate()) {
      emit(state.copyWith(status: DataStatus.loading));
      Map<String, dynamic> formValue = signInForm.currentState?.value ?? {};
      final result = await _signInUsecase(
        SignInParams(
            email: formValue['email'], password: formValue['password']),
      );
      if (result.isLeft()) {
        emit(state.copyWith(
          status: DataStatus.failure,
          error: result.getLeft()?.msg ?? '',
        ));
      } else {
        final user = result.getRight();
        await getCurrentUserData(doc: user?.user?.uid ?? '');
      }
    }
  }

  Future<void> getCurrentUserData({required String doc}) async {
    emit(state.copyWith(status: DataStatus.loading));
    final currentUser = await _getCurrentUserUsecase(doc);
    if (currentUser.isLeft()) {
      emit(state.copyWith(
          status: DataStatus.failure, error: currentUser.getLeft()?.msg));
    } else {
      final userData = currentUser.getRight();
      if(userData?.role!=null && userData?.role!=''){
        AppNavigator.pushAndRemoveUntil(RoutePath.homeRoute);
      }else {
        AppNavigator.pushAndRemoveUntil(RoutePath.roleRoute,params: userData?.id);
      }
    }
  }
}
