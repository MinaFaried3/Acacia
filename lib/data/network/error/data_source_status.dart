import 'package:acacia/data/network/error/app_failures.dart';
import 'package:acacia/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class ApiInternalStatus {
  static const int success = 200;
  static const int failure = 409;
}
// 501 Not Implemented
// 500 Internal Server Error
// 200 OK
// 201 Created
// 400 Bad Request
// 401 Unauthorized
// 402 Payment Required
// 403 Forbidden
// 404 Not Found
// 422 invalid data

// Enum for handling HTTP status codes and local failure codes
enum DataSourceStatus {
  success(200, AppStrings.success), // Success with data
  noContent(201, AppStrings.created), // Success with no data (No content)
  badRequest(400, AppStrings.badRequestError), // Failure, API rejected request
  unauthorized(
    401,
    AppStrings.unauthorizedError,
  ), // Failure, user is not authorized
  paymentRequired(402, AppStrings.paymentRequiredError), // Payment required
  forbidden(403, AppStrings.forbiddenError), // Failure, API rejected request
  notFound(404, AppStrings.notFoundError), // Failure, resource not found
  sendTimeout(408, AppStrings.timeoutError),
  invalidData(422, AppStrings.invalidDataError), // Timeout
  internalServerError(500, AppStrings.internalServerError), // Server-side error
  notImplemented(
    501,
    AppStrings.notImplementedError,
  ), // Not implemented by the server
  badResponse(444, AppStrings.defaultError), // Bad response
  badCertificate(495, AppStrings.defaultError), // Bad certificate

  // Local status codes
  connectTimeout(
    FailureCode.connectTimeout,
    AppStrings.timeoutError,
  ), // Connection timeout
  cancel(FailureCode.cancel, AppStrings.defaultError), // Request was canceled
  receiveTimeout(
    FailureCode.receiveTimeout,
    AppStrings.timeoutError,
  ), // Timeout while receiving
  cacheError(FailureCode.cacheError, AppStrings.cacheError), // Cache error
  noInternetConnection(
    FailureCode.noInternetConnection,
    AppStrings.noInternetError,
  ), // No internet connection
  defaultState(
    FailureCode.defaultState,
    AppStrings.defaultError,
  ); // Default failure

  final int code;
  final String message;

  const DataSourceStatus(this.code, this.message);
}

extension DataSourceStatusExtension on DataSourceStatus {
  bool get isSuccess =>
      this == DataSourceStatus.success || this == DataSourceStatus.noContent;

  bool get isClientError =>
      this == DataSourceStatus.badRequest ||
      this == DataSourceStatus.unauthorized ||
      this == DataSourceStatus.paymentRequired ||
      this == DataSourceStatus.forbidden ||
      this == DataSourceStatus.notFound ||
      this == DataSourceStatus.invalidData;

  bool get isServerError =>
      this == DataSourceStatus.internalServerError ||
      this == DataSourceStatus.notImplemented ||
      this == DataSourceStatus.badResponse ||
      this == DataSourceStatus.badCertificate;

  bool get isTimeout =>
      this == DataSourceStatus.sendTimeout ||
      this == DataSourceStatus.connectTimeout ||
      this == DataSourceStatus.receiveTimeout;

  bool get isNetworkError =>
      this == DataSourceStatus.noInternetConnection ||
      this == DataSourceStatus.cacheError;

  // Check if it matches a specific code
  bool isErrorCode(int statusCode) => code == statusCode;

  // Example: check if the status is 404 (Not Found)
  bool get isNotFound => this == DataSourceStatus.notFound;
}

extension DataSourceExtension on DataSourceStatus {
  Failure getFailure() {
    if (isNetworkError) {
      return NoInternetConnectionFailure(code: code, message: message);
    }

    return UnKnownFailure(code: code, message: message.tr());
  }
}
