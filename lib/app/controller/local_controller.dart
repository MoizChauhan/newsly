import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsly/app/model/article_model.dart';
import 'package:newsly/app/utils/app_toast.dart';

class LocalController extends GetxController {
  final _newsBox = Hive.box('news_box');
  List<ArticleModel> articles = [];
  RxBool loadNews = false.obs;
  void getSavedNews() {
    loadNews(true);
    final data = _newsBox.keys.map((key) {
      final value = _newsBox.get(key);
      return ArticleModel.fromJson(value);
    }).toList();
    articles = data;
    loadNews(false);
  }

  @override
  void onInit() {
    getSavedNews();
    super.onInit();
  }

  Future<void> addNews(Map<String, dynamic> newItem) async {
    await _newsBox.add(newItem).then((value) => longToastMessage("Added"));
    getSavedNews(); // update the UI
  }

  Future<void> removeNews(int itemKey) async {
    await _newsBox.delete(itemKey).then((value) => longToastMessage("Removed"));
    getSavedNews(); // update the UI
  }
}
