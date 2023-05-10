import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:newsly/app/controller/auth_controller.dart';
import 'package:newsly/app/utils/app_assets.dart';
import 'package:newsly/app/utils/app_colors.dart';
import 'package:newsly/app/widgets/app_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController =
        Get.put(AuthController(), tag: "Auth");
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 130),
              SvgPicture.asset(AppAssets.loginImage),
              SizedBox(height: 120),
              PlainButton(
                  buttonText: "Sign in with Google",
                  onpressed: () {
                    authController.signInWithGoogle();
                  },
                  color: AppColors.googleColor,
                  asset: AppAssets.googleIcon),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
