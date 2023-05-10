import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:newsly/app/utils/app_assets.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.4),
      child: Center(child: LottieBuilder.asset(AppAssets.loadingAnim)),
    );
  }
}
