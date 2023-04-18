import 'package:flutter/material.dart';
import 'package:tutors/core/constants/app_images.dart';

import '../../../../core/widgets/avatar_widget.dart';
import '../widgets/course_field.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Card(
        margin: const EdgeInsets.only(bottom: 10),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Englis for beginner",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "Offline",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  AvatarWidget(
                    imageUrl: '',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "John Smith",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              CourseField(
                icon: Icons.access_time_sharp,
                text: "60 hourse",
                
              ),
              CourseField(
                  icon: Icons.pin_drop_outlined, text: "Vientiane Capital, Laos"),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Start: Wed 8 Oct 2023",
                      style: Theme.of(context).textTheme.bodySmall),
                  Image.asset(
                    AppImages.heart,
                    width: 25,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
