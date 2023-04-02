import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/app_constants.dart';


part 'app_cubit.freezed.dart';
part 'app_state.dart';

@injectable
class AppCubit extends Cubit<AppState> {



  late GlobalKey<FormState> formKey;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AppCubit()
      : super(const AppState()) {
    // formKey = GlobalKey<FormState>();
    // getIt<FirebaseAuth>().authStateChanges().listen((User? user) {
    //   // if (user != null) {
    //   //   emit(state.copyWith(isAuth: true));
    //   // } else {
    //   //   emit(state.copyWith(isAuth: false));
    //   // }
    // });
  }



  Future<void> getAuthentication() async {
    emit(state.copyWith(status: DataStatus.loading));

    Future.delayed(const Duration(seconds: 2), () async {
      emit(state.copyWith(status: DataStatus.success, isAuth: false));
    });
  }

  Future<void> signInWithGoogle() async {
    // emit(state.copyWith(status: DataStatus.loading));
    // try {
    //   await signInWithGoogleUseCase(NoParams());
    //   emit(state.copyWith(status: DataStatus.success, isAuth: true));
    // } catch (e) {
    //   emit(state.copyWith(
    //     status: DataStatus.failure,
    //     error: e.toString(),
    //   ));
    // }
  }

  Future<void> createUserWithEmail() async {
    // emit(state.copyWith(status: DataStatus.loading));
    // try {
    //   await createUserWithEmailUseCase(EmailAndPassParams(
    //       email: emailController.text, password: passwordController.text));
    //   nameController.clear();
    //   emailController.clear();
    //   passwordController.clear();
    //   emit(state.copyWith(status: DataStatus.success, isAuth: true));
    // } catch (e) {
    //   emit(state.copyWith(
    //     status: DataStatus.failure,
    //     error: e.toString(),
    //   ));
    // }
  }

  Future<void> signInWithEmail() async {
    // emit(state.copyWith(status: DataStatus.loading));
    // try {
    //   await signInWithEmailUseCase(EmailAndPassParams(
    //       email: emailController.text, password: passwordController.text));
    //   nameController.clear();
    //   emailController.clear();
    //   passwordController.clear();
    //   emit(state.copyWith(status: DataStatus.success, isAuth: true));
    // } catch (e) {
    //   emit(state.copyWith(
    //     status: DataStatus.failure,
    //     error: e.toString(),
    //   ));
    // }
  }

  Future<void> signOut() async {
    // emit(state.copyWith(status: DataStatus.loading));
    // try {
    //   await signOutUseCase(NoParams());
    //   emit(state.copyWith(status: DataStatus.success, isAuth: false));
    // } catch (e) {
    //   emit(state.copyWith(
    //     status: DataStatus.failure,
    //     error: e.toString(),
    //   ));
    // }
  }

  @override
  Future<void> close() async {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    return super.close();
  }
}
