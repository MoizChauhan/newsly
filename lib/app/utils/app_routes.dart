import 'package:get/get.dart';
import 'package:newsly/app/screen/login_screen.dart';

class AppRoutes {
  static navigateOffLogin() {
    Get.offAll(() => LoginScreen());
  }
}
