import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../generated/locale_keys.g.dart';

class PersonalInfoWidget extends StatelessWidget {
  const PersonalInfoWidget({super.key});
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
                onPressed: () {},
                child: Text(LocaleKeys.kEdit.tr()),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Text("Nanthavath Vongsouna",style: Theme.of(context).textTheme.titleMedium),
          Text("Sofwere Engineer",style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 15),

          Text("Self employed. Softwere Egineer at ABC",style: Theme.of(context).textTheme.bodySmall),
          Text("Vientiane, Vientiane Capital, Laos",style: Theme.of(context).textTheme.bodySmall),
          Text("nanhtavadh@gmail.com",style: Theme.of(context).textTheme.bodySmall),
          Text("+8562097787336",style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
