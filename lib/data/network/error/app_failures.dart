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
