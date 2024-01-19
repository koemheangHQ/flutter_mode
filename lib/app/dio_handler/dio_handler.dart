import 'dart:developer';
import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:fluuter_model/app/dio_handler/envirament_constant.dart';
import 'package:fluuter_model/app/dio_handler/logging_interceptor.dart';
import 'package:fluuter_model/core/values/api_constant.dart';

class DioBaseHelper {
  Dio? _dio;
  Alice? alice;
  DioBaseHelper() {
    alice = Alice(showNotification: false);
    var options = BaseOptions(
      receiveTimeout: const Duration(seconds: ApiConstant.timeOut),
      connectTimeout: const Duration(seconds: ApiConstant.timeOut),
     headers: {
        'Content-Type': 'application/json',
     }
     /*
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Accept-Language': 'EN',
      },
      */
    );
    options.baseUrl = EnvironmentConstants.setEnvironment(Environment.dev);

    _dio = Dio(
      options,
    );
    _dio!.interceptors.add(LoggingInterceptors());
    _dio!.interceptors.add(alice!.getDioInterceptor()); // display log in notification view
  }
  // Method: Post
  /// Params: url, map for parameters
  Future<Response> post(String url, String params) async {
    /*
    FormData body = FormData.fromMap(params!);
    */
    Map<String, dynamic> body = {
      "contents": [
        {
          "parts": [
            {
              "text": params
            }
          ]
        }
      ]
    };
    var header = {
      'Content-Type': 'application/json',
    };
    var response = await _dio!.post(url, data: body, options: Options(headers: header));
    return response;
  }

  /// Method : PUT
  /// Params : url, map for parameters
  Future<Response> put(String url, Map<String, dynamic> params) async {
    _dio!.options.headers["Authorization"] = "";
    var response = await _dio!.put(url, data: params, options: Options(responseType: ResponseType.json));
    return response;
  }

  /// Method : DELETE
  /// Params : url, map for parameters
  Future<Response> delete(String url, Map<String, String> params) async {
    var response = await _dio!.delete(url, data: params, options: Options(responseType: ResponseType.json));
    return response;
  }

  /// Method : GET
  /// Params : url
  Future<Response> getWithoutParams(String url) async {
    log("url");

    var response = await _dio!.get(url, options: Options(responseType: ResponseType.json));
    return response;
  }

  /// Method : GET
  /// Params : url, map for parameters
  Future<Response> getWithParam(String url, Map<String, dynamic> params) async {
    _dio!.options.headers["Authorization"] = ApiConstant.authorizedKey;
    var response = (await _dio?.get(url, queryParameters: params, options: Options(responseType: ResponseType.json,  )))!;
    return response;
  }

  Future<dynamic> httpPostWithoutHeader(String url, {dynamic data, int timeout = 20}) async {
    var body = {"": ""};
    var headers = {
      "Content-type": 'application/json',

    };
   /*
    var headers = {
      "Accept-Language": 'EN',
      "wing-platform": "MARKET",
      "os-version": 'v.16',
      "device-model": "iPhone 14 Pro Max",
      "device-id": "zzzzxxxxzzxxcc",
    };
    */
    var response = await _dio
        ?.post(url, data: body, options: Options(responseType: ResponseType.json, headers: headers))
        .timeout(Duration(seconds: timeout));
    return response;
  }
}

// Api Response codes
class ApiResponseCode {
  static const int success_200 = 200;
  static const int success_201 = 201;
  static const int error_400 = 400;
  static const int error_499 = 499;
  static const int error_401 = 201;
  static const int error_404 = 201;
  static const int error_500 = 500;
  static const int internetUnavailable = 999;
  static const int unknown = 533;
}
