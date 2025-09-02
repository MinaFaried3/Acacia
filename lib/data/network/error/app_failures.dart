import 'package:equatable/equatable.dart';

import 'app_error.dart';

sealed class Failure extends Equatable {
  final int code;
  final String message;
  final AppErrors? appErrors;

  const Failure({required this.code, required this.message, this.appErrors});

  @override
  List<Object?> get props => [code, message, appErrors];

  // Boolean getters to check the type of Failure
  bool get isServerFailure => this is ServerFailure;
  bool get isNotImplementedFailure => this is NotImplementedFailure;
  bool get isNoInternetConnectionFailure => this is NoInternetConnectionFailure;
  bool get isInternalServerErrorFailure => this is InternalServerErrorFailure;
  bool get isBadRequestFailure => this is BadRequestFailure;
  bool get isUnauthorizedFailure => this is UnauthorizedFailure;
  bool get isPaymentRequiredFailure => this is PaymentRequiredFailure;
  bool get isForbiddenFailure => this is ForbiddenFailure;
  bool get isNotFoundFailure => this is NotFoundFailure;
  bool get isUnprocessableEntityFailure => this is UnprocessableEntityFailure;
  bool get isUnKnownFailure => this is UnKnownFailure;
}

final class FailureCode {
  ///data [-1] to [-99]
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int cacheError = -4;
  static const int noInternetConnection = -5;
  static const int defaultState = -6;

  ///ui [-100] for [-200]
  static const int emptyInputFieldCode = -100;

  ///permission [-201] for [-220]
  static const int locationNotWorking = -222;

  // --- 4xx: Client Errors ---
  static const int badRequest = 400; // Invalid request
  static const int unauthorized = 401; // Authentication required
  static const int forbidden = 403; // Authenticated but no permission
  static const int notFound = 404; // Resource not found
  static const int methodNotAllowed = 405; // Wrong HTTP method
  static const int requestTimeout = 408; // Request timeout
  static const int conflict = 409; // Conflict (e.g., duplicate entry)
  static const int gone = 410; // Resource permanently removed
  static const int payloadTooLarge = 413; // File/body too large
  static const int unsupportedMediaType = 415; // Wrong content type
  static const int tooManyRequests = 429; // Rate limiting

  // --- 5xx: Server Errors ---
  static const int internalServerError = 500; // Generic server error
  static const int notImplemented = 501; // API not implemented
  static const int badGateway = 502; // Invalid response from upstream
  static const int serviceUnavailable = 503; // Server overloaded/down
  static const int gatewayTimeout = 504; // Timeout from upstream
  static const int httpVersionNotSupported = 505; // HTTP version issue
}

class ServerFailure extends Failure {
  const ServerFailure({
    required super.code,
    required super.message,
    super.appErrors,
  });

  @override
  List<Object?> get props => [message, code, appErrors];
}

class NotImplementedFailure extends Failure {
  const NotImplementedFailure({
    required super.code,
    required super.message,
    super.appErrors,
  });
}

class NoInternetConnectionFailure extends Failure {
  const NoInternetConnectionFailure({
    required super.code,
    required super.message,
    super.appErrors,
  });
}

class InternalServerErrorFailure extends Failure {
  const InternalServerErrorFailure({
    required super.code,
    required super.message,
    super.appErrors,
  });
}

class BadRequestFailure extends Failure {
  const BadRequestFailure({
    required super.code,
    required super.message,
    super.appErrors,
  });
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({
    required super.code,
    required super.message,
    super.appErrors,
  });
}

class PaymentRequiredFailure extends Failure {
  const PaymentRequiredFailure({
    required super.code,
    required super.message,
    super.appErrors,
  });
}

class ForbiddenFailure extends Failure {
  const ForbiddenFailure({
    required super.code,
    required super.message,
    super.appErrors,
  });
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({
    required super.code,
    required super.message,
    super.appErrors,
  });
}

class UnprocessableEntityFailure extends Failure {
  const UnprocessableEntityFailure({
    required super.code,
    required super.message,
    super.appErrors,
  });
}

class UnKnownFailure extends Failure {
  const UnKnownFailure({
    required super.code,
    required super.message,
    super.appErrors,
  });
}

class LocationFailure extends Failure {
  const LocationFailure({
    super.code = FailureCode.locationNotWorking,
    required super.message,
    super.appErrors,
  });
}

class ConflictFailure extends Failure {
  const ConflictFailure({
    required super.code,
    required super.message,
    super.appErrors,
  });
}

class TooManyRequestsFailure extends Failure {
  const TooManyRequestsFailure({
    required super.code,
    required super.message,
    super.appErrors,
  });
}

class PreconditionFailedFailure extends Failure {
  const PreconditionFailedFailure({
    required super.code,
    required super.message,
    super.appErrors,
  });
}

class ResourceExhaustedFailure extends Failure {
  const ResourceExhaustedFailure({
    required super.code,
    required super.message,
    super.appErrors,
  });
}

class AbortedFailure extends Failure {
  const AbortedFailure({
    required super.code,
    required super.message,
    super.appErrors,
  });
}

class DeadlineExceededFailure extends Failure {
  const DeadlineExceededFailure({
    required super.code,
    required super.message,
    super.appErrors,
  });
}

class AlreadyExistsFailure extends Failure {
  const AlreadyExistsFailure({
    required super.code,
    required super.message,
    super.appErrors,
  });
}

class UnauthenticatedFailure extends Failure {
  const UnauthenticatedFailure({
    required super.code,
    required super.message,
    super.appErrors,
  });
}

class CancelFailure extends Failure {
  const CancelFailure({
    required super.code,
    required super.message,
    super.appErrors,
  });
}

class ServiceUnavailableFailure extends Failure {
  const ServiceUnavailableFailure({
    required super.code,
    required super.message,
    super.appErrors,
  });
}
