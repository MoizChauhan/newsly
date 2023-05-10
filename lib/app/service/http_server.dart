import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:newsly/app/controller/loading_controller.dart';

import 'http_service.dart';
import 'url.dart';

Response getEmptyRes = Response(
    data: "", statusCode: 700, requestOptions: RequestOptions(path: ""));

String getToken() {
  return "Bearer 42645908cbbe460295339946c25cfd4b";
}

// 42645908cbbe460295339946c25cfd4b
class HttpServe implements HttpService {
  HttpServe() {
    // Pref.init();
    _dio = Dio(BaseOptions(
      baseUrl: URL.Base_Url,
    ));

    initializeInterceptors();
  }

  late Dio _dio;
  final controller = getx.Get.put(LoadingController());

  initializeInterceptors() {
    _dio.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestHeader: true,
      responseHeader: false,
      responseBody: true,
      requestBody: true,
      logPrint: (object) {
        debugPrint(object.toString());
      },
    ));
  }

  // @override
  // void init() {
  //   _dio = Dio(BaseOptions(baseUrl: BASE_URL, headers: {'Authorization': getToken()}));
  // }

  @override
  Future<Response> getRequest(String url) async {
    Response response;
    await controller.isConnected();
    try {
      response = await _dio.get(url,
          options: Options(headers: {
            'Authorization': getToken(),
            'Content-Type': 'application/json'
          }));
    } on DioError catch (e) {
      debugPrint(e.message);
      response = getEmptyRes;
      throw Exception(e.message);
    }

    return response;
  }

  @override
  Future<Response> deleteRequest(String url, body) async {
    Response response;
    await controller.isConnected();
    try {
      response = await _dio.delete(url,
          data: body,
          options: Options(headers: {
            'Authorization': getToken(),
            'Content-Type': 'application/json'
          }));
    } on DioError catch (e) {
      debugPrint(e.message);
      response = getEmptyRes;
      throw Exception(e.message);
    }

    return response;
  }

  @override
  Future<Response> patchRequest(String url, body) async {
    Response response;
    await controller.isConnected();
    try {
      response = await _dio.patch(url,
          data: jsonEncode(body),
          options: Options(headers: {
            'Authorization': getToken(),
            'Content-Type': 'application/json'
          }));
    } on DioError catch (e) {
      debugPrint(e.message);
      response = getEmptyRes;
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> postRequest(String url, body) async {
    Response response;
    await controller.isConnected();
    try {
      response = await _dio.post(url,
          data: jsonEncode(body),
          options: Options(headers: {
            'Authorization': getToken(),
            'Content-Type': 'application/json'
          }));
    } on DioError catch (e) {
      debugPrint(e.message);
      response = e.response!;
      // throw Exception(e.message);
    }

    return response;
  }

  @override
  Future<Response> postRequestFormData(String url, FormData body) async {
    Response response;
    await controller.isConnected();
    try {
      response = await _dio.post(url,
          data: body,
          options: Options(headers: {
            'Authorization': getToken(),
            // 'Content-Type': 'multipart/form-data'
            'Content-Type': 'application/json'
          }));
    } on DioError catch (e) {
      debugPrint(e.message);
      response = e.response!;
      // throw Exception(e.message);
    }

    return response;
  }

  @override
  Future<Response> putRequest(String url, body) async {
    Response response;
    await controller.isConnected();
    try {
      response = await _dio.put(url,
          data: body,
          options: Options(headers: {
            'Authorization': getToken(),
            'Content-Type': 'application/json'
          }));
    } on DioError catch (e) {
      debugPrint(e.message);
      response = getEmptyRes;
      throw Exception(e.message);
    }

    return response;
  }

  @override
  Future<Response> putRequestFormData(String url, FormData body) async {
    Response response;
    await controller.isConnected();
    try {
      response = await _dio.put(url,
          data: body,
          options: Options(headers: {
            'Authorization': getToken(),
            // 'Content-Type': 'multipart/form-data'
            'Content-Type': 'application/json'
          }));
    } on DioError catch (e) {
      debugPrint(e.message);
      response = e.response!;
      // throw Exception(e.message);
    }

    return response;
  }
}
