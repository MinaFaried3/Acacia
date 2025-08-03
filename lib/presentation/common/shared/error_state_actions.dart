import 'dart:io';

import 'package:acacia/app/config/flavors/app_config.dart';
import 'package:acacia/app/services/di/dependency_injection.dart';
import 'package:acacia/app/services/navigation/navigation.dart';
import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:acacia/app/shared/extensions/empty_or_null.dart';
import 'package:acacia/data/network/cache_on_subsequent_calls.dart';
import 'package:acacia/data/network/dio_factory/dio_factory.dart';
import 'package:acacia/data/network/error/app_failures.dart';
import 'package:acacia/presentation/common/enums/ui_state.dart';
import 'package:acacia/presentation/resources/routes/routes_manager.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

import 'base_state.dart';

void errorStateActions(BuildContext context, BaseState state) {
  if (state.uiState.isFailed == false) return;

  switch (state.failure) {
    case null:
      PrintManager.print('unKnown error');
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
    case ServerFailure():
      PrintManager.print('ServerFailure');
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
    case NotImplementedFailure():
      PrintManager.print('NotImplementedFailure');
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
    case NoInternetConnectionFailure():
      PrintManager.print('NoInternetConnectionFailure');
      context.pushNamed(RoutesStrings.connectionRoute);
    case InternalServerErrorFailure():
      PrintManager.print('InternalServerErrorFailure');
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
    case BadRequestFailure():
      PrintManager.print('BadRequestFailure');
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
    case UnauthorizedFailure():
      PrintManager.print('UnauthorizedFailure');
      userLogoutAndNavigateToLogin(context);
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
    case PaymentRequiredFailure():
      PrintManager.print('PaymentRequiredFailure');
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
    case ForbiddenFailure():
      PrintManager.print('ForbiddenFailure');
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
    case NotFoundFailure():
      PrintManager.print('NotFoundFailure');
      context.pushNamed(
        RoutesStrings.notFound404Route,
        arguments: (state.failure?.message).fromNullToEmpty,
      );
    case UnprocessableEntityFailure():
      PrintManager.print('UnprocessableEntityFailure');
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
    case LocationFailure():
      PrintManager.print(state.failure?.message, color: ConsoleColor.redBg);
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
    case UnKnownFailure():
      PrintManager.print('UnKnownFailure');
    // CustomSnackBar.show(context, (state.failure?.message).fromNullToEmpty);
  }
}

void userLogoutAndNavigateToLogin(BuildContext context) async {
  // go to Login Route
  context.pushNamedAndRemoveUntil(RoutesStrings.loginRoute);
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
