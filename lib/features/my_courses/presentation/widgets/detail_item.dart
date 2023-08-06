import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  final String title;
  final String? content;
  const DetailItem({super.key,required this.title,this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("$title:", style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(width: 10,),
          Text(content ?? '', style: Theme.of(context).textTheme.titleSmall)
        ],
      ),
    );
  }
}
