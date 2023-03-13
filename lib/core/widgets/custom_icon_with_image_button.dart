import 'package:flutter/material.dart';
import 'package:tutors/core/constants/app_colors.dart';

class CustomIconWithImageButton extends StatelessWidget {
  const CustomIconWithImageButton({
    super.key,
    this.onTap,
    required this.imageUri,
    required this.text,
  });

  final void Function()? onTap;
  final String imageUri;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.primaryColor,
        ),
      ),
      child: InkWell(
        focusColor: Colors.white,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(imageUri),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
