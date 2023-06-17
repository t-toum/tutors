import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tutors/generated/locale_keys.g.dart';

import '../../../../core/models/users.dart';

class InstructorWidget extends StatelessWidget {
  final Users? user;
  final Function()? onTap;
  const InstructorWidget({super.key, this.user, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${user?.firstName} ${user?.lastName}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LocaleKeys.kTeacher.tr()),
                  InkWell(
                    onTap: onTap,
                    child: CachedNetworkImage(
                      imageUrl: user?.profileUrl ?? '',
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.amber,
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.kEducation.tr(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: user?.educations?.map((e) {
                          return Text("${e.school}");
                        }).toList() ??
                        [],
                  ),
                ),
                Text(
                  LocaleKeys.kSkills.tr(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: user?.skills?.map((e) {
                          return Text(e);
                        }).toList() ??
                        [],
                  ),
                ),
              ],
            ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          LocaleKeys.kAbout.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(user?.about ?? "-"),
      ],
    );
  }
}
