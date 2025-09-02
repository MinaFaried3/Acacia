import 'dart:io';

import 'package:acacia/app/config/flavors/app_config.dart';
import 'package:acacia/app/services/di/dependency_injection.dart';
import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:acacia/data/network/cache_on_subsequent_calls.dart';
import 'package:acacia/data/network/dio_factory/dio_factory.dart';
import 'package:acacia/data/network/error/app_failures.dart';
import 'package:acacia/presentation/common/enums/ui_state.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

import 'base_state.dart';

void errorStateActions(BuildContext context, BaseState state) {
  if (state.uiState.isFailed == false) return;

  switch (state.failure) {
    case null:
      printer('unKnown error');
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
    case ServerFailure():
      printer('ServerFailure');
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
    case NotImplementedFailure():
      printer('NotImplementedFailure');
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
    case NoInternetConnectionFailure():
      printer('NoInternetConnectionFailure');
    //TODO handle not found for push named
    // context.pushNamed(RoutesStrings.connectionRoute);
    case InternalServerErrorFailure():
      printer('InternalServerErrorFailure');
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
    case BadRequestFailure():
      printer('BadRequestFailure');
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
    case UnauthorizedFailure():
      printer('UnauthorizedFailure');
      userLogoutAndNavigateToLogin(context);
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
    case PaymentRequiredFailure():
      printer('PaymentRequiredFailure');
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
    case ForbiddenFailure():
      printer('ForbiddenFailure');
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
    case NotFoundFailure():
      printer('NotFoundFailure');
    //TODO handle not found for push named
    // context.pushNamed(
    //   RoutesStrings.notFound404Route,
    //   extra: (state.failure?.message).fromNullToEmpty,
    // );
    case UnprocessableEntityFailure():
      printer('UnprocessableEntityFailure');
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
    case LocationFailure():
      printer(state.failure?.message, color: ConsoleColor.redBg);
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
    case UnKnownFailure():
      printer('UnKnownFailure');
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
    case ConflictFailure():
      // TODO: Handle this case.
      throw UnimplementedError();
    case TooManyRequestsFailure():
      // TODO: Handle this case.
      throw UnimplementedError();
    case PreconditionFailedFailure():
      // TODO: Handle this case.
      throw UnimplementedError();
    case ResourceExhaustedFailure():
      // TODO: Handle this case.
      throw UnimplementedError();
    case AbortedFailure():
      // TODO: Handle this case.
      throw UnimplementedError();
    case DeadlineExceededFailure():
      // TODO: Handle this case.
      throw UnimplementedError();
    case AlreadyExistsFailure():
      // TODO: Handle this case.
      throw UnimplementedError();
    case UnauthenticatedFailure():
      // TODO: Handle this case.
      throw UnimplementedError();
    case CancelFailure():
      // TODO: Handle this case.
      throw UnimplementedError();
    case ServiceUnavailableFailure():
      // TODO: Handle this case.
      throw UnimplementedError();
  }
}

void userLogoutAndNavigateToLogin(BuildContext context) async {
  // go to Login Route
  // context.go(RoutesStrings.loginRoute);
  if (Platform.isIOS) {
    // FirebaseFirestore.instance
    //     .collection('user')
    //     .doc('${DateTime.now().toUtc()}')
    //     .set({
    //   'platform': Platform.operatingSystem,
    //   'environment': Platform.environment,
    //   'authorization': await getIt<AppPreferences>().token,
    //   'fcmToken': await AppNotificationService.getDeviceToken(),
    //   if (Platform.isIOS)
    //     'apnsToken': await AppNotificationService.getIOSAPNsToken(),
    //   'env': AppConfig.instance.flavor.name,
    //   'headers': getIt<Dio>().options.headers
    // });
  }
  getIt<FirebaseAnalytics>().logEvent(
    name: 'UnauthorizedFailure',
    parameters: {
      'platform': Platform.operatingSystem,
      'environment': Platform.environment.toString(),
      'authorization': 'await getIt<AppPreferences>().token',
      'fcmToken': 'await AppNotificationService.getDeviceToken()',
      if (Platform.isIOS)
        'apnsToken': ' await AppNotificationService.getIOSAPNsToken()',
      'env': AppConfig.instance.flavor.name,
      'headers': 'getIt<Dio>().options.headers.toString()',
    },
  );
  // remove data
  userLogout();
}

void userLogout() async {
  // remove data
  getIt<DioFactory>().refreshDioOptionsWithToken();
  //todo
  // getIt<LocalDataSource>().userLogout();
  CacheOnSubsequentCalls.reset();
}
