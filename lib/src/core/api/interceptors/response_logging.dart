// ignore_for_file: strict_raw_type

import 'package:canverro_gallery_task/src/core/helpers/logging_helper.dart';
import 'package:dio/dio.dart';

class ResponseLoggingInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    logInfo({
      'type': 'Request--->',
      'url': options.uri.toString(),
      'method': options.method,
      'payload': options.data.toString(),
    });
    handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    logInfo({
      'type': 'Response<---',
      'http_code': response.statusCode,
      'url': response.realUri.toString(),
      'response': response.data,
    });

    handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    logError(err, null);
    handler.next(err);
  }
}
