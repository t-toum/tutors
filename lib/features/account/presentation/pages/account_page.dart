import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tutors/core/constants/app_colors.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/models/education.dart';
import 'package:tutors/core/models/experience.dart';
import 'package:tutors/core/navigator/app_navigator.dart';
import 'package:tutors/core/widgets/loading_widget.dart';
import 'package:tutors/features/account/presentation/cubit/account_cubit.dart';
import 'package:tutors/features/account/presentation/pages/user_info/user_detail_page.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../widgets/cover_widget.dart';
import '../widgets/education_widget.dart';
import '../widgets/experience_widget.dart';
import '../widgets/personal_info_widget.dart';
import '../widgets/profile_avatar_widget.dart';
import '../widgets/skills_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AccountCubit>();
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        if (state.status == DataStatus.loading) {
          return const LoadingWidget();
        }
        final bool isSelf = state.isSelf;
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
                                      isSelf: state.isSelf,
                                      url: state.currentUser?.coverUrl ?? '',
                                      onTap: () {
                                        AppNavigator.openModalImagePicker(
                                            onCamera: () async {
                                          AppNavigator.goBack();
                                          await cubit.getImage(
                                              imageSource: ImageSource.camera,
                                              type: ImageType.cover);
                                        }, onGallery: () async {
                                          AppNavigator.goBack();
                                          await cubit.getImage(
                                              imageSource: ImageSource.gallery,
                                              type: ImageType.cover);
                                        });
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: PersonalInfoWidget(
                                      users: state.currentUser,
                                      isSefl: state.isSelf,
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                  top: 140,
                                  left: 20,
                                  child: ProfileAvatarWidget(
                                    isSelf: state.isSelf,
                                    url: state.currentUser?.profileUrl ?? '',
                                    onTap: () {
                                      AppNavigator.openModalImagePicker(
                                          onCamera: () async {
                                        AppNavigator.goBack();
                                        await cubit.getImage(
                                            imageSource: ImageSource.camera,
                                            type: ImageType.profile);
                                      }, onGallery: () async {
                                        AppNavigator.goBack();
                                        await cubit.getImage(
                                            imageSource: ImageSource.gallery,
                                            type: ImageType.profile);
                                      });
                                    },
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
                            onTap: () {
                              AppNavigator.openModalBottomSheet(
                                  body: UserDetailPage(
                                    user: state.currentUser,
                                  ),
                                  title: LocaleKeys.kUserInfo.tr());
                            },
                            child: Text(
                              LocaleKeys.kShowAll.tr(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocSelector<AccountCubit, AccountState, List<Education>>(
                    selector: (state) {
                      return state.currentUser?.educations ?? [];
                    },
                    builder: (context, state) {
                      return EducationWidget(
                        educations: state,
                        isSelf: isSelf,
                      );
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  BlocSelector<AccountCubit, AccountState, List<Experience>?>(
                      selector: (state) {
                    return state.currentUser?.experiences;
                  }, builder: (context, state) {
                    return ExperienceWidget(
                      experiences: state,
                      isSelf: isSelf,
                    );
                  }),

                  const SizedBox(
                    height: 10,
                  ),
                  SkillsWidget(
                    isSelf: isSelf,
                    skills: state.currentUser?.skills ?? [],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
