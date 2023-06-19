// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:sellproducts/util/connectivity_utils.dart';

class CacheInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (!ConnectivityUtils.instance.hasInternet) {
      if (options.method.toUpperCase() == "GET") {
        handler.reject(DioError(
            requestOptions: options,
            type: DioErrorType.cancel,
            error: "No Internet"));
        return;
      }
      handler.reject(DioError(
          requestOptions: options,
          type: DioErrorType.cancel,
          error: "No Internet"));
      return;
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (response.data is ResponseBody) {
      handler.next(response);
      return;
    }
    super.onResponse(response, handler);
  }
}
