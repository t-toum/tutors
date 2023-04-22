

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/constants/app_images.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import 'add_education_page.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(LocaleKeys.kEducation.tr(),style: Theme.of(context).textTheme.titleMedium,),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: (){
                AppNavigator.openModalBottomSheet(body: AddEducationPage(), title: "Add education");
              },
              child: Image.asset(AppImages.plusGrey,width: 25,height: 25,),
            ),
          )
        ],
      ),
    );
  }
}