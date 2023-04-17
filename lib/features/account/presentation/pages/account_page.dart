import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/features/account/presentation/cubit/account_cubit.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../widgets/cover_widget.dart';
import '../widgets/education_widget.dart';
import '../widgets/experence_widget.dart';
import '../widgets/personal_info_widget.dart';
import '../widgets/profile_avatar_widget.dart';
import '../widgets/skills_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.secondaryColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Persional Infomation
                  Card(
                    margin: EdgeInsets.zero,
                    child: Column(
                      children: [
                        Container(
                          height: 380,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Expanded(
                                    child: CoverWidget(
                                      url:
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrHAFlZ65LYXXw3I1lMuCvpANXgwOxitbWfA&usqp=CAU',
                                      onTap: () {},
                                    ),
                                  ),
                                  Expanded(
                                    child: PersonalInfoWidget(),
                                  )
                                ],
                              ),
                              Positioned(
                                  top: 140,
                                  left: 20,
                                  child: ProfileAvatarWidget(
                                    url:
                                        'https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg',
                                    onTap: () {},
                                  ))
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 1.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              LocaleKeys.kShowAll.tr(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  EducationWidget(),
                  const SizedBox(height: 10,),
                  ExperenceWidget(),
                  const SizedBox(height: 10,),
                  SkillsWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
