import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:newsly/app/utils/app_routes.dart';
import 'package:newsly/main.dart';

class AuthController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  String? uid;
  String? token;
  int? forceResendingToken;
  //var conCode = "+48";
  RxString selectedCountryCode = "+91".obs;

  Future signInWithGoogle() async {
    loadingcontroller.updateLoading(true);
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential user =
        await FirebaseAuth.instance.signInWithCredential(credential);
    if (user.user != null) {
      AppRoutes.navigateOffHome();
    }
    loadingcontroller.updateLoading(false);
  }
}
