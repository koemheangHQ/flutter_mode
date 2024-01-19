import 'dart:developer';

import 'package:dio/dio.dart';

class LoggingInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("----> ${options.method.isNotEmpty ? options.method.toLowerCase() : 'METHOD'} ${"${options.baseUrl}${options.path}"}");
    log("Headers:::::");
    options.headers.forEach((key, value) => log('$key: $value'));
    log("queryParameters::::: ${options.data}");
    options.queryParameters.forEach((key, value) => log("$key, $value"));
    if (options.data != null) {
      log("Body::::: ${options.data}");
    }
    log("--> END ${options.method.isNotEmpty ? options.method.toUpperCase() : 'METHOD'}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // ignore: unnecessary_null_comparison
    log("<-- ${response.statusCode} ${(response.requestOptions != null ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL')}");

    log("Headers:::::");
    response.headers.forEach((k, v) => log('$k: $v'));
    log("Response:::: ${response.data}");
    log("<-- END HTTP");
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("error:::::: ${err.response}");
    log("<-- ${err.message} ${(err.response?.requestOptions != null ? (err.response!.requestOptions.baseUrl + err.requestOptions.path) : 'URL')}");
    log("${err.response != null ? err.response?.data : 'Unknown Error'}");
    log("<-- End error::::");
    log('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.baseUrl}');
    return super.onError(err, handler);
  }
}
