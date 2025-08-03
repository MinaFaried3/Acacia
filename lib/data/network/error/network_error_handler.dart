import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:acacia/app/shared/extensions/not_nullable_extensions.dart';
import 'package:acacia/data/responses/base_response/error_response.dart';
import 'package:acacia/presentation/resources/strings_manager.dart';
import 'package:dio/dio.dart';

import 'app_error.dart';
import 'app_failures.dart';
import 'data_source_status.dart';

class ErrorHandler implements Exception {
  late final Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = handleError(error);
    } else {
      failure = DataSourceStatus.defaultState.getFailure();
    }
  }
}

Failure handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSourceStatus.connectTimeout.getFailure();

    case DioExceptionType.sendTimeout:
      return DataSourceStatus.sendTimeout.getFailure();

    case DioExceptionType.receiveTimeout:
      return DataSourceStatus.receiveTimeout.getFailure();

    case DioExceptionType.cancel:
      return DataSourceStatus.cancel.getFailure();

    case DioExceptionType.unknown:
      return DataSourceStatus.defaultState.getFailure();

    case DioExceptionType.badCertificate:
      return DataSourceStatus.badCertificate.getFailure();

    case DioExceptionType.badResponse:
      return handleBadResponseFailure(error);

    case DioExceptionType.connectionError:
      return DataSourceStatus.internalServerError.getFailure();
  }
}

Failure handleBadResponseFailure(DioException error) {
  final int? statusCode = error.response?.statusCode;

  try {
    final ErrorResponse errorResponse = ErrorResponse.fromJson(
      error.response?.data,
    );

    final AppErrors appErrors = AppErrors(errors: errorResponse.errors);

    final String message = errorResponse.message ?? AppStrings.defaultError;

    if (statusCode == null) return DataSourceStatus.badResponse.getFailure();

    switch (statusCode) {
      case 501:
        return NotImplementedFailure(
          code: statusCode,
          message: message,
          appErrors: appErrors,
        );
      case 500:
        return InternalServerErrorFailure(
          code: statusCode,
          message: message,
          appErrors: appErrors,
        );
      case 400:
        return BadRequestFailure(
          code: statusCode,
          message: message,
          appErrors: appErrors,
        );
      case 401:
        return UnauthorizedFailure(
          code: statusCode,
          message: message,
          appErrors: appErrors,
        );
      case 402:
        return PaymentRequiredFailure(
          code: statusCode,
          message: message,
          appErrors: appErrors,
        );
      case 403:
        return ForbiddenFailure(
          code: statusCode,
          message: message,
          appErrors: appErrors,
        );
      case 404:
        return NotFoundFailure(
          code: statusCode,
          message: message,
          appErrors: appErrors,
        );
      case 422:
        return UnprocessableEntityFailure(
          code: statusCode,
          message: message,
          appErrors: appErrors,
        );
      default:
        return UnKnownFailure(
          code: statusCode,
          message: AppStrings.defaultError,
          appErrors: appErrors,
        );
    }
  } catch (e) {
    PrintManager.print(
      "error from Server ,,,,,,, $statusCode",
      color: ConsoleColor.redBg,
    );
    return InternalServerErrorFailure(
      code: statusCode.orZero(),
      message: error.response?.statusMessage ?? '',
      appErrors: AppErrors(errors: {}),
    );
  }
}
