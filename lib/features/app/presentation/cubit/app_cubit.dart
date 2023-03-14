import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/usecases/no_params.dart';
import 'package:tutors/features/app/domain/usecases/sign_in_with_google_usecase.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  final SignInWithGoogleUseCase signInWithGoogleUseCase;

  AppCubit(this.signInWithGoogleUseCase) : super(const AppState());

  Future<void> getAuthentication() async {
    emit(state.copyWith(status: DataStatus.loading));

    Future.delayed(const Duration(seconds: 2), () async {
      emit(state.copyWith(status: DataStatus.success, isAuth: false));
    });
  }

  Future<void> signInWithGoogle() async {
    emit(state.copyWith(status: DataStatus.loading));
    try {
      await signInWithGoogleUseCase(NoParams());
      emit(state.copyWith(status: DataStatus.success, isAuth: true));
    } catch (e) {
      emit(state.copyWith(
        status: DataStatus.failure,
        error: e.toString(),
      ));
    }
  }
}
