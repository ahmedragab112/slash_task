import 'package:dio/dio.dart';
import 'package:slash_task/core/error/api_error_model.dart';
import 'package:slash_task/core/error/api_errors.dart';


enum DataSource {
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  // apiLogicError,
  defaultError
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unauthorized = 401; // failure, user is not authorised
  static const int forbidden = 403; // failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404; // failure, not found
  static const int apiLogicError = 422; // API , logic error

  // local status code
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultError = -7;
}

class ResponseMessage {
  static const String noContent =
      ApiErrors.noContent; // success with no data (no content)
  static const String badRequest =
      ApiErrors.badRequestError; // failure, API rejected request
  static const String unauthorized =
      ApiErrors.unauthorizedError; // failure, user is not authorised
  static const String forbidden =
      ApiErrors.forbiddenError; // failure, API rejected request
  static const String internalServerError =
      ApiErrors.internalServerError; // failure, crash in server side
  static const String notFound =
      ApiErrors.notFoundError; // failure, crash in server side

  // local status code
  static const String connectTimeout = ApiErrors.timeoutError;
  static const String cancel = ApiErrors.defaultError;
  static const String receiveTimeout = ApiErrors.timeoutError;
  static const String sendTimeout = ApiErrors.timeoutError;
  static const String cacheError = ApiErrors.cacheError;
  static const String noInternetConnection = ApiErrors.noInternetError;
  static const String defaultError = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.noContent:
        return ApiErrorModel(message: ResponseMessage.noContent, code: ResponseCode.noContent);
      case DataSource.badRequest:
        return ApiErrorModel(message: ResponseMessage.badRequest , code: ResponseCode.badRequest);
      case DataSource.forbidden:
        return ApiErrorModel(message: ResponseMessage.forbidden , code: ResponseCode.forbidden);
      case DataSource.unauthorized:
        return ApiErrorModel(message: ResponseMessage.unauthorized , code: ResponseCode.unauthorized);
      case DataSource.notFound:
        return ApiErrorModel(message: ResponseMessage.notFound , code: ResponseCode.notFound);
      case DataSource.internalServerError:
        return ApiErrorModel(message: ResponseMessage.internalServerError , code: ResponseCode.internalServerError);
      case DataSource.connectTimeout:
        return ApiErrorModel(message: ResponseMessage.connectTimeout , code: ResponseCode.connectTimeout);
      case DataSource.cancel:
        return ApiErrorModel(message: ResponseMessage.cancel , code: ResponseCode.cancel);
      case DataSource.receiveTimeout:
        return ApiErrorModel(message: ResponseMessage.receiveTimeout , code: ResponseCode.receiveTimeout);
      case DataSource.sendTimeout:
        return ApiErrorModel(message: ResponseMessage.sendTimeout , code: ResponseCode.sendTimeout);
      case DataSource.cacheError:
        return ApiErrorModel(message: ResponseMessage.cacheError , code: ResponseCode.cacheError);
      case DataSource.noInternetConnection:
        return ApiErrorModel(message: ResponseMessage.noInternetConnection , code: ResponseCode.noInternetConnection);
      case DataSource.defaultError:
        return ApiErrorModel(message: ResponseMessage.defaultError , code: ResponseCode.defaultError);
    }
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      apiErrorModel = _handleError(error);
    } else {
      // default error
      apiErrorModel = DataSource.defaultError.getFailure();
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return ApiErrorModel.fromJson(error.response!.data);
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.defaultError.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.defaultError.getFailure();
  }
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}