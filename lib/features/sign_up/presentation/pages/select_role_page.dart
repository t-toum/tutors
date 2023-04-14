import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tutors/generated/locale_keys.g.dart';

class SelectRolePage extends StatelessWidget {
  final String id;
  const SelectRolePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.kSelectYourRole.tr(),
        ),
        centerTitle: true,
      ),
    );
  }
}
