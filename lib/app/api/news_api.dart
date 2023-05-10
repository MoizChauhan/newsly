import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsly/app/model/news_model.dart';
import 'package:newsly/app/service/http_server.dart';
import 'package:newsly/app/service/url.dart';

import '../service/http_service.dart';

class NewsApi {
  static HttpService httpService = HttpServe();

  static Future<NewsModel?> getNewsApi(page, {String search = ""}) async {
    try {
      var searchparam = "";
      if (search != "") {
        searchparam = "q=$search";
      } else {
        searchparam = "q=a";
      }
      Response res = await httpService.getRequest(
          "${URL.All_Articles}?$searchparam&pageSize=20&page=$page");
      if (res.statusCode == 200) {
        return NewsModel.fromJson(res.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Error at getMenuItemsApi is ${e.toString()}");
      return null;
    }
  }

  static Future<NewsModel?> getLatestApi() async {
    try {
      Response res = await httpService.getRequest(URL.TopHeadlines);
      if (res.statusCode == 200) {
        return NewsModel.fromJson(res.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Error at getMenuItemsApi is ${e.toString()}");
      return null;
    }
  }
}
