import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/usecases/no_params.dart';
import 'package:tutors/features/home/domain/usecases/sign_out_usecase.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final SignOutUsecase _signOutUsecase;
  HomeCubit(this._signOutUsecase) : super(const HomeState());
  Future<void> signOut() async {
    await _signOutUsecase(NoParams());
  }
}
