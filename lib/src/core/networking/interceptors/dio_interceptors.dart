import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor extends Interceptor {
  LoggingInterceptor({this.logger});

  final Logger? logger;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger?.i('REQUEST[${options.method}] => URL: ${options.uri}\n'
        'REQUEST DATA => ${options.data}\n'
        'Headers: ${options.headers}');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    logger?.i(
      'RESPONSE[${response.statusCode}] =>'
      ' PATH:${response.requestOptions.path}\n'
      'RESPONSE DATA: ${response.data}',
    );
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    logger?.e('ERROR[${err.requestOptions.uri}]\n'
        'ERROR[${err.response?.statusCode}] => PATH:'
        ' ${err.requestOptions.path}\n'
        'ERROR[${err.response?.data}]');
    super.onError(err, handler);
  }
}
