import 'package:flutter/material.dart';
import 'package:tutors/core/constants/app_colors.dart';

class TabItem extends StatelessWidget {
  final String title;
  final Widget icon;
  final bool active;
  final Widget activeIcon;
  final VoidCallback? onPressed;
  const TabItem(
      {super.key,
      required this.title,
      required this.activeIcon,
      required this.icon,
      this.active = false,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          active ? activeIcon : icon,
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: active ? AppColors.primaryColor : Colors.black,
                ),
          )
        ],
      ),
    );
  }
}
