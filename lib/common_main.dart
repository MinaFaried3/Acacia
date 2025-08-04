import 'dart:io';

import 'package:acacia/app/config/platform/platform.dart';
import 'package:acacia/app/services/di/dependency_injection.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/config/flavors/app_config.dart';
import 'app/services/hive/hive_constants.dart';
import 'app/services/localization/language_manager.dart';
import 'app/shared/common/bloc_observer.dart';
import 'app/shared/common/constants.dart';

Future<Widget> initMain(AppConfig child) async {
  WidgetsFlutterBinding.ensureInitialized();

  //FOR WEB URL strategy
  if (child.platform.isWeb) {
    // Use the path URL strategy for web
    usePathUrlStrategy();
  }

  if (Platform.isIOS) {
    await AppTrackingTransparency.requestTrackingAuthorization();
  }

  ///firebase
  await Firebase.initializeApp(options: child.fireBaseOptions);

  FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  if (!kIsWeb) {
    // Enable Crashlytics collection
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }

  // catch errors from flutter framework
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // ErrorWidget.builder = (error) => NotFoundPage(error: error);
  //
  await DIModulesManger.prepareAppModule();
  //
  // AppNotificationService.initNotification();
  //
  // ///local storage setup
  await Hive.initFlutter();
  HiveConstants.registerHiveTypeAdapters();
  //
  await EasyLocalization.ensureInitialized();
  //
  if (kDebugMode) {
    Bloc.observer = getIt<MyBlocObserver>();
  }
  //
  if (child.platform.isMobile) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  return EasyLocalization(
    supportedLocales: const [
      LocalizationManager.arabicLocal,
      LocalizationManager.englishLocal,
    ],
    path: LocalizationManager.assetsPath,
    startLocale: LocalizationManager.getLangLocal(
      //TOdo
      AppConstants.defaultLang.getLangWithCountry(),
    ),
    fallbackLocale: LocalizationManager.englishLocal,
    child: child,
  );

  return child;
}
