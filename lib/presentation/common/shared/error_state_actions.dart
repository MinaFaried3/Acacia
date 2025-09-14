import 'dart:io';

import 'package:acacia/app/config/flavors/app_config.dart';
import 'package:acacia/app/services/di/dependency_injection.dart';
// import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:acacia/data/network/cache_on_subsequent_calls.dart';
import 'package:acacia/data/network/dio_factory/dio_factory.dart';
import 'package:acacia/data/network/error/app_failures.dart';
import 'package:acacia/presentation/common/enums/ui_state.dart';
import 'package:acacia/presentation/ui/widgets/app_toast/app_toast.dart';
import 'package:acacia/presentation/ui/widgets/app_toast/content_type.dart';
import 'package:acacia/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

import 'base_state.dart';

void errorStateActions(BuildContext context, BaseState state) {
  if (state.uiState.isFailed == false) return;

  void showToast(String key, String? message, ContentType type) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        content: AppToast(
          title: key.tr(), 
          message: message ?? "",
          contentType: type,
        ),
      ),
    );
  }

  switch (state.failure) {
    case null:
      showToast(AppStrings.errorUnknown, state.failure?.message, ContentType.failure);

    case ServerFailure():
      showToast(AppStrings.errorServer, state.failure?.message, ContentType.failure);

    case NotImplementedFailure():
      showToast(AppStrings.errorNotImplemented, state.failure?.message, ContentType.warning);

    case NoInternetConnectionFailure():
      showToast(AppStrings.errorNoInternet, state.failure?.message ?? "تحقق من الاتصال", ContentType.warning);

    case InternalServerErrorFailure():
      showToast(AppStrings.errorInternalServer, state.failure?.message, ContentType.failure);

    case BadRequestFailure():
      showToast(AppStrings.errorBadRequest, state.failure?.message, ContentType.failure);

    case UnauthorizedFailure():
      showToast(AppStrings.errorUnauthorized, "برجاء تسجيل الدخول مرة أخرى", ContentType.failure);
      userLogoutAndNavigateToLogin(context);

    case PaymentRequiredFailure():
      showToast(AppStrings.errorPaymentRequired, state.failure?.message, ContentType.warning);

    case ForbiddenFailure():
      showToast(AppStrings.errorForbidden, state.failure?.message, ContentType.failure);

    case NotFoundFailure():
      showToast(AppStrings.errorNotFound, state.failure?.message, ContentType.warning);

    case UnprocessableEntityFailure():
      showToast(AppStrings.errorUnprocessableEntity, state.failure?.message, ContentType.warning);

    case LocationFailure():
      showToast(AppStrings.errorLocation, state.failure?.message, ContentType.failure);

    case UnKnownFailure():
      showToast(AppStrings.errorUnknown, state.failure?.message, ContentType.failure);

    case ConflictFailure():
      showToast(AppStrings.errorConflict, state.failure?.message, ContentType.failure);

    case TooManyRequestsFailure():
      showToast(AppStrings.errorTooManyRequests, state.failure?.message, ContentType.warning);

    case PreconditionFailedFailure():
      showToast(AppStrings.errorPreconditionFailed, state.failure?.message, ContentType.failure);

    case ResourceExhaustedFailure():
      showToast(AppStrings.errorResourceExhausted, state.failure?.message, ContentType.failure);

    case AbortedFailure():
      showToast(AppStrings.errorAborted, state.failure?.message, ContentType.failure);

    case DeadlineExceededFailure():
      showToast(AppStrings.errorDeadlineExceeded, state.failure?.message, ContentType.failure);

    case AlreadyExistsFailure():
      showToast(AppStrings.errorAlreadyExists, state.failure?.message, ContentType.warning);

    case UnauthenticatedFailure():
      showToast(AppStrings.errorUnauthenticated, state.failure?.message, ContentType.failure);

    case CancelFailure():
      showToast(AppStrings.errorCancelled, state.failure?.message, ContentType.warning);

    case ServiceUnavailableFailure():
      showToast(AppStrings.errorServiceUnavailable, state.failure?.message, ContentType.failure);
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
