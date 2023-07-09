import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tutors/core/constants/app_colors.dart';

class PickImageWidget extends StatelessWidget {
  final File? file;
  final Function()? onRemove;
  final Function()? onTap;
  const PickImageWidget({super.key, this.file, this.onRemove, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: AppColors.greyColor,
        width: double.infinity,
        height: 200,
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: file != null ? Image.file(file!) : const Icon(Icons.image),
            ),
            if (file != null) ...[
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: onRemove,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const Icon(Icons.close),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
