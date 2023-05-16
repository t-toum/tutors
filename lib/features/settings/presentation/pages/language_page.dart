import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../../../../core/constants/app_constants.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        title: Text(
          LocaleKeys.kLanguage.tr(),
        ),
      ),
      body: BlocConsumer<SettingCubit, SettingState>(
        listener: (context, state) {
          if (state.isSetlang == true) {
            print(state.language);
            context.setLocale(Locale(state.language));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                RadioListTile<String>(
                  value: state.language,
                  groupValue: AppLanguage.en.name,
                  onChanged: (value) async {
                    await context.read<SettingCubit>().setLanguage(code:AppLanguage.en.name);
                  },
                  title: Text(LocaleKeys.kEnglish.tr()),
                  subtitle: const Text('Supporting text'),
                ),
                RadioListTile<String>(
                  value: state.language,
                  groupValue: AppLanguage.lo.name,
                  onChanged: (data) async {
                    print(data);
                    await context.read<SettingCubit>().setLanguage(code: AppLanguage.lo.name);
                  },
                  title: Text(LocaleKeys.kLao.tr()),
                  subtitle: const Text('Supporting text'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
