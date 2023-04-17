import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutors/core/constants/app_constants.dart';
import 'package:tutors/core/constants/app_images.dart';
import 'package:tutors/core/widgets/loading_widget.dart';
import 'package:tutors/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../widgets/role_widget.dart';

class SelectRolePage extends StatelessWidget {
  final String id;
  const SelectRolePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.kSelectYourRole.tr(),
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (context, state) {
          if(state.status == DataStatus.loading){
            return const LoadingWidget();
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.kWhatIsYourRole.tr(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoleWidget(
                      icon: AppImages.teacher,
                      title: LocaleKeys.kTeacher.tr(),
                      onTap: () async {
                        await context
                            .read<SignUpCubit>()
                            .updateUserRole(doc: id, role: "teacher");
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    RoleWidget(
                      icon: AppImages.student,
                      title: LocaleKeys.kStudent.tr(),
                      onTap: () async {
                        await context
                            .read<SignUpCubit>()
                            .updateUserRole(doc: id, role: "student");
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
