import 'package:acacia/config/flavors/app_config.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<Widget> initMain(AppConfig child) async {
  WidgetsFlutterBinding.ensureInitialized();

  // if (Platform.isIOS) {
  //   await AppTrackingTransparency.requestTrackingAuthorization();
  // }

  ///firebase
  await Firebase.initializeApp(options: child.fireBaseOptions);

  FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // catch errors from flutter framework
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // ErrorWidget.builder = (error) => NotFoundPage(error: error);
  //
  // await DIModulesManger.prepareAppModule();
  //
  // AppNotificationService.initNotification();
  //
  // ///local storage setup
  // await Hive.initFlutter();
  // HiveConstants.registerHiveTypeAdapters();
  //
  // await EasyLocalization.ensureInitialized();
  //
  // if (kDebugMode) {
  //   Bloc.observer = getIt<MyBlocObserver>();
  // }
  //
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);

  // return EasyLocalization(
  //   supportedLocales: const [
  //     LocalizationManager.somaliLocal,
  //     LocalizationManager.englishLocal,
  //   ],
  //   path: LocalizationManager.assetsPath,
  //   startLocale: LocalizationManager.getLangLocal(
  //     await getIt<AppPreferences>().getAppLanguage(),
  //   ),
  //   fallbackLocale: LocalizationManager.englishLocal,
  //   child: child,
  // );

  return child;
}
