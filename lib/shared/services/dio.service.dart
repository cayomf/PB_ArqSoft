// ignore_for_file: avoid_print
import 'dart:async';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class DioService {
  final Dio dio;

  DioService(this.dio) {
    if (dio.httpClientAdapter is DefaultHttpClientAdapter) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.badCertificateCallback = (cert, host, port) => true;
        return client;
      };
    }
  }

  void _addCommonHeaders(Map<String, String> headers, bool useCache) {
    headers['Connection'] = "keep-alive";
    if (useCache == false) {
      headers['Cache-Control'] = 'no-cache';
    }
  }

  Future<Response> delete<T>(String path,
      {CancelToken? cancelToken, String? contentType, List<String>? cookies, bool useCache = true}) async {
    cancelToken = cancelToken ?? CancelToken();

    var headers = {Headers.contentTypeHeader: 'application/json'};

    if (cookies != null) {
      var cookiesConcat = cookies.map((e) => e.substring(0, e.indexOf(';'))).join(';');
      headers['cookie'] = cookiesConcat;
    }

    _addCommonHeaders(headers, useCache);

    try {
      return await dio
          .delete<T>(path,
              options: Options(
                headers: headers,
                followRedirects: false,
                validateStatus: (status) {
                  return status != null && status >= 200 && status <= 302;
                },
              ),
              cancelToken: cancelToken)
          .timeout(const Duration(seconds: 30));
    } on TimeoutException catch (error) {
      cancelToken.cancel();
      throw DioError(error: error, requestOptions: RequestOptions(path: path));
    }
  }

  Future<Response<T>> get<T>(String path,
      {CancelToken? cancelToken, List<String>? cookies, bool useCache = true}) async {
    cancelToken = cancelToken ?? CancelToken();

    return await dio
        .get<T>(path,
            options: Options(
              followRedirects: false,
              extra: {'withCredentials': cookies != null && cookies.isNotEmpty},
              validateStatus: (status) {
                return status != null && status >= 200 && status <= 302;
              },
            ),
            cancelToken: cancelToken)
        .timeout(const Duration(seconds: 30));
  }

  Future<Response<T>> post<T>(String path, dynamic body,
      {bool useCookies = false,
      String? contentType,
      List<String>? cookies,
      CancelToken? cancelToken,
      bool useCache = true}) async {
    try {
      return await dio
          .post<T>(path,
              data: body,
              options: Options(
                followRedirects: false,
                validateStatus: (status) {
                  return status != null && status >= 200 && status <= 302;
                },
              ),
              cancelToken: cancelToken)
          .timeout(const Duration(seconds: 30));
    } catch (error) {
      throw DioError(error: error, requestOptions: RequestOptions(path: path));
    }
  }

  Future<Response> put<T>(String path, dynamic body,
      {bool useCookies = false,
      String? contentType,
      List<String>? cookies,
      CancelToken? cancelToken,
      bool useCache = true}) async {
    cancelToken = cancelToken ?? CancelToken();
    var headers = <String, String>{};
    if (body is! FormData) {
      headers[Headers.contentTypeHeader] = contentType ?? 'application/json';
      headers[Headers.acceptHeader] = '*/*';
    }

    if (cookies != null) {
      var cookiesConcat = cookies.map((e) => e.substring(0, e.indexOf(';'))).join(';');
      headers['cookie'] = cookiesConcat;
    }

    _addCommonHeaders(headers, useCache);

    try {
      return await dio
          .put<T>(path,
              data: body,
              options: Options(
                headers: headers,
                followRedirects: false,
                validateStatus: (status) {
                  return status != null && status >= 200 && status <= 302;
                },
              ),
              cancelToken: cancelToken)
          .timeout(const Duration(seconds: 30));
    } on TimeoutException catch (error) {
      cancelToken.cancel();
      throw DioError(error: error, requestOptions: RequestOptions(path: path));
    }
  }
}
