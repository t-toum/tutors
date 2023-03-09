import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/app_constants.dart';

part 'app_state.dart';
part 'app_cubit.freezed.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  Future<void> getAuthentication() async {
    emit(state.copyWith(status: DataStatus.loading));

    Future.delayed(const Duration(seconds: 2), () async {
      emit(state.copyWith(status: DataStatus.success, isAuth: true));
    });
  }
}
