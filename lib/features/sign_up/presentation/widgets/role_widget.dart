import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class RoleWidget extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final String icon;
  const RoleWidget({super.key, this.onTap,required this.title,required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: AppColors.greyColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 80,
            width: 100,
            child: Column(
              children: [
                Image.asset(
                  icon,
                  width: 60,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
