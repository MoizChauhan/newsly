import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsly/app/api/news_api.dart';
import 'package:newsly/app/model/article_model.dart';

class HomeController extends GetxController {
  RxBool gettingNews = true.obs;
  RxBool gettingTop = true.obs;
  List<ArticleModel> articles = [];
  List<ArticleModel> breakingNewsArticles = [];
  int pageCount = 1;
  TextEditingController searchController = TextEditingController();

  late ScrollController scrollController;
  bool hasMore = true;
  RxBool hasMoreLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllNews();
    getTopNews();
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.offset >=
                (scrollController.position.maxScrollExtent * 0.50) &&
            !scrollController.position.outOfRange) {
          debugPrint("Scrolled");
          if (hasMore) {
            pageCount++;
            getMoreNews();
          }
        }
      });
  }

  getTopNews() async {
    gettingTop(true);

    var res = await NewsApi.getLatestApi();
    if (res != null) {
      breakingNewsArticles = res.articles;
      // hasMore = res.hasNextPage;
    }
    gettingTop(false);
    // Get.forceAppUpdate();
    update();
  }

  getAllNews() async {
    gettingNews(true);
    pageCount = 1;
    print(searchController.text);

    var res =
        await NewsApi.getNewsApi(pageCount, search: searchController.text);
    if (res != null) {
      articles = res.articles;
      // hasMore = res.hasNextPage;
    }
    gettingNews(false);
    // Get.forceAppUpdate();
    update();
  }

  getMoreNews() async {
    hasMoreLoading(true);

    var res =
        await NewsApi.getNewsApi(pageCount, search: searchController.text);
    if (res != null) {
      articles.addAll(res.articles);
      hasMore = true;
    }
    hasMoreLoading(false);
    Get.forceAppUpdate();
  }
}
