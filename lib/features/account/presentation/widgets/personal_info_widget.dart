import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/models/users.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/features/account/presentation/cubit/account_cubit.dart';

import '../../../../generated/locale_keys.g.dart';
import '../pages/user_info/account_edit_info_page.dart';

class PersonalInfoWidget extends StatelessWidget {
  final Users? users;
  final bool isSefl;
  const PersonalInfoWidget({super.key, this.users, required this.isSefl});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  isSefl
                      ? TextButton(
                          onPressed: () {
                            AppNavigator.openModalBottomSheet(
                              title: LocaleKeys.kEditInfo.tr(),
                              body: BlocProvider<AccountCubit>.value(
                                value: context.read<AccountCubit>(),
                                child: const AccountEditInfoPage(),
                              ),
                            );
                          },
                          child: Text(LocaleKeys.kEdit.tr()),
                        )
                      : const SizedBox(
                          height: 40,
                        )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text("${users?.firstName} ${users?.lastName}",
                  style: Theme.of(context).textTheme.titleMedium),
              users?.jobTitle != null
                  ? Text(users?.jobTitle ?? '-',
                      style: Theme.of(context).textTheme.bodyMedium)
                  : const SizedBox(),
              const SizedBox(height: 15),
              (users?.position != null || users?.industry != null)
                  ? Text("${users?.position ?? ''}. ${users?.industry ?? ''}",
                      style: Theme.of(context).textTheme.bodySmall)
                  : const SizedBox(),
              (users?.city != null || users?.country != null)
                  ? Text("${users?.city ?? ''}, ${users?.country ?? ''}",
                      style: Theme.of(context).textTheme.bodySmall)
                  : const SizedBox(),
              Text(users?.email ?? '',
                  style: Theme.of(context).textTheme.bodySmall),
              Text(users?.phone ?? '',
                  style: Theme.of(context).textTheme.bodySmall),
              Text(LocaleKeys.kAbout.tr()),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Text(
                    users?.about ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ))
            ],
          ),
        );
      },
    );
  }
}
