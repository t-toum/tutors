import 'package:flutter/material.dart';

class CourseField extends StatelessWidget {
  final IconData icon;
  final String text;
  const CourseField({super.key,required this.icon,required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,size: 20,),
        const SizedBox(width: 5),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
