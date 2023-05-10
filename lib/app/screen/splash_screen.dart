import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsly/app/utils/app_assets.dart';
import 'package:newsly/app/utils/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      AppRoutes.navigateOffLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(AppAssets.background),
        fit: BoxFit.cover,
      )),
      child: Image.asset(AppAssets.appLogo),
    );
  }
}
