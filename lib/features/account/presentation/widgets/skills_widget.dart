
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../generated/locale_keys.g.dart';
import 'header_bar.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderBar(
              title: LocaleKeys.kSkills.tr(),
            ),
            const SizedBox(height: 10),
            Text("Microsoct Office",style: Theme.of(context).textTheme.bodyMedium,),
            const Divider(thickness: 2),
            Text("Adobe Photoshop",style: Theme.of(context).textTheme.bodyMedium,),
            const Divider(thickness: 2),
            Text("Adobe Photoshop",style: Theme.of(context).textTheme.bodyMedium,),
            const Divider(thickness: 2),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}