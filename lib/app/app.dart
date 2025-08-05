import 'package:acacia/app/app_cubit.dart';
import 'package:acacia/app/config/app_mode.dart';
import 'package:acacia/app/services/di/dependency_injection.dart';
import 'package:acacia/app/shared/common/constants.dart';
import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:acacia/presentation/resources/routes/observers.dart';
import 'package:acacia/presentation/resources/theme_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../presentation/resources/routes/router.dart';
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

  static final navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

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
            return MaterialApp.router(
              localizationsDelegates: customLocalizationDelegate,
              supportedLocales: context.supportedLocales,

              locale: context.locale,
              debugShowCheckedModeBanner: false,

              title: AppStrings.appTitle.tr(),
              onGenerateTitle: (_) {
                return AppStrings.appTitle.tr();
              },
              darkTheme: getApplicationTheme(),
              themeMode: ThemeMode.dark,
              routerConfig: GoRouter.routingConfig(
                initialLocation: state.openingRoutePath,
                routingConfig: appRoutingConfig,
                navigatorKey: MyApp.navigatorKey,
                observers: routesObservers,
                debugLogDiagnostics: AppMode.devMode,
              ),
            );
          },
        ),
      ),
    );
  }
}
