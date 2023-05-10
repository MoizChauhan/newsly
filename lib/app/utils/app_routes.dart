import 'package:get/get.dart';
import 'package:newsly/app/model/article_model.dart';
import 'package:newsly/app/screen/article_screen.dart';
import 'package:newsly/app/screen/home_page.dart';
import 'package:newsly/app/screen/login_screen.dart';

class AppRoutes {
  static navigateOffLogin() {
    Get.offAll(() => LoginScreen());
  }

  static navigateOffHome() {
    Get.offAll(() => HomeScreen());
  }

  static navigateToArticlePage({required ArticleModel article}) {
    Get.to(() => ArticleScreen(article: article));
  }
}
