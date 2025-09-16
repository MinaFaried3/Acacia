import 'dart:io';

import 'package:acacia/app/config/flavors/app_config.dart';
import 'package:acacia/app/services/di/dependency_injection.dart';
// import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:acacia/data/network/cache_on_subsequent_calls.dart';
import 'package:acacia/data/network/dio_factory/dio_factory.dart';
import 'package:acacia/data/network/error/app_failures.dart';
import 'package:acacia/presentation/common/enums/ui_state.dart';
import 'package:acacia/presentation/ui/widgets/app_toast/app_toast.dart';
import 'package:acacia/presentation/ui/widgets/app_toast/toast_type.dart';
import 'package:acacia/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

import 'base_state.dart';

void showToast(
  BuildContext context, {
  required String key,
  String? message,
  required ToastType type,
}) {
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

void errorStateActions(BuildContext context, BaseState state) {
  if (state.uiState.isFailed == false) return;

  switch (state.failure) {
    case null:
      showToast(
        context,
        key: AppStrings.errorUnknown,
        message: state.failure?.message,
        type: ToastType.failure,
      );

    case ServerFailure():
      showToast(
        context,
        key: AppStrings.errorServer,
        message: state.failure?.message,
        type: ToastType.failure,
      );

    case NotImplementedFailure():
      showToast(
        context,
        key: AppStrings.errorNotImplemented,
        message: state.failure?.message,
        type: ToastType.warning,
      );

    case NoInternetConnectionFailure():
      showToast(
        context,
        key: AppStrings.errorNoInternet,
        message: state.failure?.message ?? "تحقق من الاتصال",
        type: ToastType.warning,
      );

    case InternalServerErrorFailure():
      showToast(
        context,
        key: AppStrings.errorInternalServer,
        message: state.failure?.message,
        type: ToastType.failure,
      );

    case BadRequestFailure():
      showToast(
        context,
        key: AppStrings.errorBadRequest,
        message: state.failure?.message,
        type: ToastType.failure,
      );

    case UnauthorizedFailure():
      showToast(
        context,
        key: AppStrings.errorUnauthorized,
        message: "برجاء تسجيل الدخول مرة أخرى",
        type: ToastType.failure,
      );
      userLogoutAndNavigateToLogin(context);

    case PaymentRequiredFailure():
      showToast(
        context,
        key: AppStrings.errorPaymentRequired,
        message: state.failure?.message,
        type: ToastType.warning,
      );

    case ForbiddenFailure():
      showToast(
        context,
        key: AppStrings.errorForbidden,
        message: state.failure?.message,
        type: ToastType.failure,
      );

    case NotFoundFailure():
      showToast(
        context,
        key: AppStrings.errorNotFound,
        message: state.failure?.message,
        type: ToastType.warning,
      );

    case UnprocessableEntityFailure():
      showToast(
        context,
        key: AppStrings.errorUnprocessableEntity,
        message: state.failure?.message,
        type: ToastType.warning,
      );

    case LocationFailure():
      showToast(
        context,
        key: AppStrings.errorLocation,
        message: state.failure?.message,
        type: ToastType.failure,
      );

    case UnKnownFailure():
      showToast(
        context,
        key: AppStrings.errorUnknown,
        message: state.failure?.message,
        type: ToastType.failure,
      );

    case ConflictFailure():
      showToast(
        context,
        key: AppStrings.errorConflict,
        message: state.failure?.message,
        type: ToastType.failure,
      );

    case TooManyRequestsFailure():
      showToast(
        context,
        key: AppStrings.errorTooManyRequests,
        message: state.failure?.message,
        type: ToastType.warning,
      );

    case PreconditionFailedFailure():
      showToast(
        context,
        key: AppStrings.errorPreconditionFailed,
        message: state.failure?.message,
        type: ToastType.failure,
      );

    case ResourceExhaustedFailure():
      showToast(
        context,
        key: AppStrings.errorResourceExhausted,
        message: state.failure?.message,
        type: ToastType.failure,
      );

    case AbortedFailure():
      showToast(
        context,
        key: AppStrings.errorAborted,
        message: state.failure?.message,
        type: ToastType.failure,
      );

    case DeadlineExceededFailure():
      showToast(
        context,
        key: AppStrings.errorDeadlineExceeded,
        message: state.failure?.message,
        type: ToastType.failure,
      );

    case AlreadyExistsFailure():
      showToast(
        context,
        key: AppStrings.errorAlreadyExists,
        message: state.failure?.message,
        type: ToastType.warning,
      );

    case UnauthenticatedFailure():
      showToast(
        context,
        key: AppStrings.errorUnauthenticated,
        message: state.failure?.message,
        type: ToastType.failure,
      );

    case CancelFailure():
      showToast(
        context,
        key: AppStrings.errorCancelled,
        message: state.failure?.message,
        type: ToastType.warning,
      );

    case ServiceUnavailableFailure():
      showToast(
        context,
        key: AppStrings.errorServiceUnavailable,
        message: state.failure?.message,
        type: ToastType.failure,
      );
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
