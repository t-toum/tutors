import 'package:flutter/material.dart';


class FavoriteWidget extends StatelessWidget {
  final Function()? onTap;
  final String image;
  const FavoriteWidget({super.key,this.onTap,required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(image),
            )),
      ),
    );
  }
}
