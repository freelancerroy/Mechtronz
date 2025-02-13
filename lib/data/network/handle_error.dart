import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:mechtronz/global/controller/init_controller.dart';

String handleError(error) {
  if (error is Exception) {
    try {
      String errorDescription = "";
      if (error is DioException) {
        switch (error.type) {
          case DioExceptionType.cancel:
            errorDescription = "Request cancelled";
            break;
          case DioExceptionType.connectionTimeout:
            errorDescription = "Connection timeout";
            break;
          case DioExceptionType.unknown:
            errorDescription = "No internet connection";
            break;
          case DioExceptionType.receiveTimeout:
            errorDescription = "Receive timeout in connection with API server";
            break;
          case DioExceptionType.badResponse:
            switch (error.response!.statusCode) {
              case 400:
                errorDescription = getError(error.response)!;
                break;
              case 401:
                errorDescription = getError(error.response)!;
                getx.Get.find<InitController>().signOut();
                break;
              case 403:
                errorDescription = getError(error.response)!;
                break;
              case 404:
                errorDescription = getError(error.response)!;
                break;
              case 408:
                errorDescription = getError(error.response)!;
                break;
              case 422:
                errorDescription = getError(error.response)!;
                break;
              case 500:
                errorDescription = getError(error.response)!;
                break;
              case 503:
                errorDescription = getError(error.response)!;
                break;
              default:
                errorDescription =
                    "Received invalid status code: ${error.response?.statusCode ?? ''}";
            }

            errorDescription = errorDescription;
            break;

          case DioExceptionType.badCertificate:
            errorDescription = "Bad certificate";
            break;
          case DioExceptionType.connectionError:
            errorDescription = "Connection error";
            break;
          case DioExceptionType.sendTimeout:
            errorDescription = "Connection request timeout";
            break;
        }
      } else if (error is SocketException) {
        errorDescription = "No internet connection";
      } else {
        errorDescription = "Unexpected error occurred";
      }
      return errorDescription;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      return "Unexpected error occurred";
    }
  } else {
    if (error.toString().contains("is not a subtype of")) {
      return "Unable to process the data";
    } else {
      return "Unexpected error occurred";
      // if (error
      //     .toString()
      //     .contains(AppStrings.null_check_operator_used_on_a_null_value)) {
      //   return AppStrings.request_cancelled;
      // } else {
      //   return AppStrings.no_internet_connection;
      // }
    }
  }
}

String? getError(Response? response) {
  String errorMessage = "Unexpected error occurred";
  if (response?.data != null && response?.data is Map) {
    if ((response?.data as Map).containsKey('error')) {
      errorMessage = getErrorMsg(response?.data["error"]);
    } else if ((response?.data as Map).containsKey('message')) {
      errorMessage = getErrorMsg(response?.data["message"]);
    }
    return errorMessage;
    // if ((response.data as Map).containsKey('error') ||
    //     (response.data as Map).containsKey('msg')) {
    //   final errorMessageHeading = (response.data)["error"];
    //   Helper.printLogValue("errorMessageHeading $errorMessageHeading");
    //   if (errorMessageHeading is String) {
    //     Helper.printLogValue("Error is String  $errorMessageHeading");
    //     return errorMessageHeading;
    //   } else if (errorMessageHeading is List) {
    //     Helper.printLogValue("Error is List  $errorMessageHeading");
    //     return errorMessageHeading.join(' , ');
    //   } else if (errorMessageHeading is Map) {
    //     Helper.printLogValue("Error is Map  $errorMessageHeading");
    //     List<String> errorList = [];
    //     errorMessageHeading.forEach((key, value) {
    //       if (value is List) {
    //         errorList.add(value[0]);
    //       } else {
    //         errorList.add(value);
    //       }
    //     });
    //     Helper.printLogValue("Error is Map  ${errorList.join(' , ')}");
    //     return errorList.join(' , ');
    //   } else {
    //     return AppStrings.unexpected_error_occured;
    //   }
    // } else {
    //   return AppStrings.unexpected_error_occured;
    // }
  }
  return errorMessage;
}

String getErrorMsg(final errorMessageHeading) {
  if (errorMessageHeading is String) {
    return errorMessageHeading;
  } else if (errorMessageHeading is List) {
    return errorMessageHeading.join(' , ');
  } else if (errorMessageHeading is Map) {
    if (errorMessageHeading.containsKey('message')) {
      return errorMessageHeading['message'];
    } else {
      List<String> errorList = [];
      errorMessageHeading.forEach((key, value) {
        if (value is List) {
          errorList.add(value[0]?.toString() ?? '');
        } else {
          errorList.add(value?.toString() ?? '');
        }
      });
      return errorList.join(' , ');
    }
  } else {
    return "Unexpected error occurred";
  }
}
