import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_model/app/dio_handler/dio_handler.dart';
import 'package:fluuter_model/core/values/string_constant.dart';

BuildContext? context;

class ApiResponse<T> {
  ApiStatus? status;
  T? data;
  String? message;
  ApiError? apiError;

  ApiResponse({this.status, this.data, this.apiError});

  /// loading
  static ApiResponse<T> loading<T>() {
    return ApiResponse<T>(status: ApiStatus.loading, data: null);
  }

  /// success
  static ApiResponse<T> success<T>(T data) {
    return ApiResponse<T>(status: ApiStatus.completed, data: data);
  }

  /// error
  static ApiResponse<T> error<T>({int? errCode, String? errMsg, T? errBdy, T? data}) {
    var apiError = ApiError(statusCode: errCode, errorMessage: errMsg, errorBody: errBdy);
    return ApiResponse<T>(status: ApiStatus.error, apiError: apiError, data: data);
  }

  /// method wraps response in ApiResponse class
  static ApiResponse<T> returnResponse<T>(Response response, T apiResponse) {
    if (response.statusCode == ApiResponseCode.internetUnavailable) {
      Navigator.pop(context!);
      return ApiResponse.error(errCode: response.statusCode, errMsg: StringConstants.noInternetConnection, data: null);
    } else if (response.statusCode == ApiResponseCode.success_201 ||
        response.statusCode == ApiResponseCode.success_200) {
      return ApiResponse.success(apiResponse);
    } else if (response.statusCode! >= ApiResponseCode.error_400 && response.statusCode! <= ApiResponseCode.error_499) {
      Navigator.pop(context!);
      return ApiResponse.error(
          errCode: response.statusCode, errMsg: response.statusMessage, errBdy: apiResponse, data: apiResponse);
    } else {
      Navigator.pop(context!);
      return ApiResponse.error(
          errCode: ApiResponseCode.error_500,
          errMsg: StringConstants.somethingWentWrong,
          errBdy: apiResponse,
          data: null);
    }
  }

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

/// Error class to store Api Error Response
class ApiError<T> {
  int? statusCode;
  String? errorMessage;
  T? errorBody;

  ApiError({this.statusCode, this.errorMessage, this.errorBody});
}

/// Enum to check Api Status
enum ApiStatus { loading, completed, error }
