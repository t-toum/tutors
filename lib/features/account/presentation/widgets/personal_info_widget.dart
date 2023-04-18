import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tutors/core/models/users.dart';
import 'package:tutors/core/navigator/app_navigator.dart';

import '../../../../generated/locale_keys.g.dart';
import '../pages/account_edit_info_page.dart';

class PersonalInfoWidget extends StatelessWidget {
  final Users? users;
  const PersonalInfoWidget({super.key, this.users});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  AppNavigator.openModalBottomSheet(
                    title: LocaleKeys.kEditInfo.tr(),
                    body: AccountEditInfoPage(),
                  );
                },
                child: Text(LocaleKeys.kEdit.tr()),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(users?.username ?? ' ',
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
          Text(users?.tel ?? '', style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
