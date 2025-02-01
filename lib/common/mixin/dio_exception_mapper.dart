import 'package:dio/dio.dart';
import 'package:youcancode/common/exception/failure.dart';
import 'package:youcancode/common/extension/string_hardcoded.dart';

mixin DioExceptionMapper {
  Failure mapDioExceptionToFailure(DioException e, StackTrace stackTrace) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return Failure(
          message: "Connection timeout with API server. Please try again later"
              .hardcoded,
          exception: e,
          stackTrace: stackTrace,
        );
      case DioExceptionType.sendTimeout:
        return Failure(
          message:
              "Send timeout with API server. Check your internet connection and try again"
                  .hardcoded,
          exception: e,
          stackTrace: stackTrace,
        );
      case DioExceptionType.receiveTimeout:
        return Failure(
          message:
              "Receive timeout with API server. Check your internet connection and try again"
                  .hardcoded,
          exception: e,
          stackTrace: stackTrace,
        );
      case DioExceptionType.badCertificate:
        return Failure(
          message: "Bad certificate with API server. Please try again later"
              .hardcoded,
          exception: e,
          stackTrace: stackTrace,
        );
      case DioExceptionType.badResponse:
        return Failure(
          message: _getErrorMessageForStatusCode(e.response?.statusCode),
          exception: e,
          stackTrace: stackTrace,
        );
      case DioExceptionType.cancel:
        return Failure(
          message: "Request to API server was cancelled".hardcoded,
          exception: e,
          stackTrace: stackTrace,
        );
      case DioExceptionType.connectionError:
        return Failure(
          message: "Connection error with API server. Please try again later"
              .hardcoded,
          exception: e,
          stackTrace: stackTrace,
        );
      case DioExceptionType.unknown:
        return Failure(
          message: "Unknown error occurred. Please try again later".hardcoded,
          exception: e,
          stackTrace: stackTrace,
        );
    }
  }
}

String _getErrorMessageForStatusCode(int? statusCode) {
  switch (statusCode) {
    case 400:
      return "Bad request. Please try again later".hardcoded;
    case 401:
      return "Unauthorized. Please try again later".hardcoded;
    case 403:
      return "Forbidden. Please try again later".hardcoded;
    case 404:
      return "Not found. Please try again later".hardcoded;
    case 498:
      return "Refresh token expired. Please try again later".hardcoded;
    case 500:
      return "Internal server error. Please try again later".hardcoded;
    case 503:
      return "Service unavailable. Please try again later".hardcoded;
    default:
      return "Unknown error".hardcoded;
  }
}
