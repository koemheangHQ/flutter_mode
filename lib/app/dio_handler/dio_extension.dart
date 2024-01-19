import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fluuter_model/app/dio_handler/dio_handler.dart';
import 'package:fluuter_model/app/dio_handler/dio_model.dart';
import 'package:fluuter_model/app/dio_handler/dio_response.dart';
import 'package:fluuter_model/core/values/string_constant.dart';

extension DioExtension on Future<Response<dynamic>> {
  Future execute<T>(Function(Map<String, dynamic>) model) async {
    try {
      final res = await this;
      return ApiResponse.returnResponse(res, res.data);
    } on Exception catch (error, stacktrace) {
      if (error is DioException) {
        dynamic errorResponse = error.response?.data;
        dynamic statusCode = error.response?.statusCode;

        try {
          // Jum peak ErrorBody
          var errResponse = ErrorBody.fromJson(error.response?.data);
          return ApiResponse.returnResponse(error.response!, errResponse);
        } catch (error) {
          return ApiResponse.error(
              errCode: ApiResponseCode.unknown,
              errMsg: statusCode != null ? errorResponse['message'] : StringConstants.noInternetConnection,
              errBdy: StringConstants.somethingWentWrong,
              data: null);
        }
      }
      return ApiResponse.error(
          errCode: ApiResponseCode.unknown, errMsg: error.toString(), errBdy: stacktrace.toString(), data: null);
    }
  }
}

extension ControllerResponseExtension on Future<dynamic> {
  Future getResponse<T>(Function(dynamic) responseData) async {
    //  showProgressBar();

    var response = await this as ApiResponse;

    if (response.data != null && response.status == ApiStatus.completed) {
      responseData(response);
    } else {
      var message = '';
      if (response.data != null) {
        message = response.data.detail;
      } else {
        message = response.apiError!.errorMessage!;
      }
      //showSnackBar("Error Message ",message,Colors.black,false,"error");
      log("Error Message: $message");
    }
  }
}
