import 'package:dio/dio.dart';

abstract class HttpService {
  Future<Response> getRequest(String url);
  Future<Response> postRequest(String url, body);
  Future<Response> postRequestFormData(String url, FormData body);
  Future<Response> patchRequest(String url, body);
  Future<Response> putRequest(String url, body);
  Future<Response> putRequestFormData(String url, FormData body);
  Future<Response> deleteRequest(String url, body);
}
