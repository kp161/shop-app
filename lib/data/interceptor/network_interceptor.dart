import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/core/utils/preference_utils.dart';
import 'package:shop_app/core/utils/preference_constant.dart';
import 'package:shop_app/data/interceptor/retry_interceptor.dart';
import 'package:shop_app/data/interceptor/token_interceptor.dart';

class NetworkInterceptor extends Interceptor {
  final RetryInterceptor retryInterceptor;
  final TokenInterceptor tokenInterCeptor;

  NetworkInterceptor({
    required this.retryInterceptor,
    required this.tokenInterCeptor,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final headers = _headers();
    options.headers.addAll(headers);

    options.receiveTimeout = const Duration(milliseconds: 30000);

    debugPrint('Final Header being send: ${options.headers}');
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (_shouldRetry(err)) {
      handler.resolve(
        await retryInterceptor.scheduleRetryRequest(err.requestOptions),
      );
    } else {
      handler.resolve(
        err.response ??
            Response(
              requestOptions: err.requestOptions,
              statusCode: 403,
              data: {"error": err.error, "error_description": err.message},
            ),
      );
    }
  }

  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.unknown && err.error is SocketException;
  }

  Map<String, String> _headers() {
    Map<String, String> headers = {};
    final token = getString(PreferenceConstant.accessToken);
    log("Token from preference: $token");
    if (token.isNotEmpty) {
      debugPrint("Authorization Header Set ===> Bearer $token");
      headers["Authorization"] = 'Bearer $token';
    }
    headers["Content-Type"] = 'application/json';
    return headers;
  }
}
