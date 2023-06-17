import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../generated/locale_keys.g.dart';

class HeaderBar extends StatelessWidget {
  final String title;
  final bool isSelf;
  final Function()? onEdit;
  final Function()? addNew;
  const HeaderBar({
    super.key,
    required this.title,
    this.onEdit,
    this.addNew,
    required this.isSelf,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        if (isSelf)
          Row(
            children: [
              InkWell(
                onTap: addNew,
                child: Image.asset(AppImages.plusGrey, width: 20),
              ),
              const SizedBox(width: 15),
              InkWell(
                onTap: onEdit,
                child: Text(
                  LocaleKeys.kEdit.tr(),
                ),
              ),
            ],
          )
      ],
    );
  }
}
