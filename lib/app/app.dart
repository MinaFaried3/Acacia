import 'package:acacia/app/app_cubit.dart';
import 'package:acacia/app/services/di/dependency_injection.dart';
import 'package:acacia/app/services/navigation/navigation_observer.dart';
import 'package:acacia/app/shared/common/constants.dart';
import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:acacia/presentation/resources/routes/routes_manager.dart';
import 'package:acacia/presentation/resources/theme_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../presentation/resources/strings_manager.dart' show AppStrings;
import 'config/flavors/app_config.dart';

class MyApp extends StatefulWidget {
  //named constructor
  const MyApp._internal();

  //singleton instance
  static MyApp? _instance;

  factory MyApp() {
    _instance ??= MyApp._internal();
    return _instance!;
  }

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    /// the following will make the code work without generating critical errors but it's not the right behavior
    // context.setLocale(LocalizationManager.englishLocal);
    context.setLocale(context.locale);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    PrintManager.print(
      AppConfig.instance.flavor.name,
      color: ConsoleColor.brightCyanBg,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AppCubit>()..getCurrentRoute(),
          lazy: false,
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(
          AppConstants.screenUtilWidth,
          AppConstants.screenUtilHeight,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            final customLocalizationDelegate = context.localizationDelegates;
            return MaterialApp(
              localizationsDelegates: customLocalizationDelegate,
              supportedLocales: context.supportedLocales,
              navigatorKey: MyApp.navigatorKey,
              navigatorObservers: [
                FirebaseAnalyticsObserver(
                  analytics: getIt<FirebaseAnalytics>(),
                ),
                MyNavigatorObserver(),
              ],
              locale: context.locale,
              debugShowCheckedModeBanner: false,

              title: AppStrings.appTitle.tr(),
              onGenerateTitle: (_) {
                return AppStrings.appTitle.tr();
              },
              darkTheme: getApplicationTheme(),
              themeMode: ThemeMode.dark,
              home: child,
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: state.openingRoutePath,
              // initialRoute: Routes.notification.path,
            );
          },
        ),
      ),
    );
  }
}
