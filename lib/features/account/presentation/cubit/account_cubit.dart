import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tutors/core/constants/app_constants.dart';

part 'account_state.dart';
part 'account_cubit.freezed.dart';

@injectable
class AccountCubit extends Cubit<AccountState> {
  AccountCubit() : super(const AccountState());
}
