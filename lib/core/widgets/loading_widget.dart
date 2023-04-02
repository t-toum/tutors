import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tutors/core/constants/lotties_path.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              LottiesPath.loadingDot,
              width: 100,
              height: 100
            ),
          ],
        ),
      ),
    );
  }
}
