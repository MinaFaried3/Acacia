import 'dart:io';
import 'dart:ui';

import 'package:acacia/app/config/flavors/app_config.dart';
import 'package:acacia/app/services/di/dependency_injection.dart';
import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:acacia/data/network/error/app_failures.dart';
import 'package:acacia/presentation/common/enums/ui_state.dart';
import 'package:acacia/presentation/common/shared/base_state.dart';
import 'package:acacia/presentation/common/shared/safe_emitter.dart';
import 'package:acacia/presentation/resources/routes/routes_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> with SafeEmitter<AppState> {
  // final LocalDataSource localDataSource;

  AppCubit(
    // {required this.localDataSource}
  ) : super(
        AppState(
          uiState: UiState.initial,
          openingRoutePath: Routes.adminLogin.path,
        ),
      ) {
    initApp();
  }

  final analytics = getIt<FirebaseAnalytics>();
  // final remoteConfig = getIt<AppRemoteConfig>();

  void initApp() {
    try {
      getIt<FirebaseAnalytics>().logAppOpen();
      printer('APP OPENED +++++------', color: ConsoleColor.cyan);
      getIt<FirebaseAnalytics>().logEvent(
        name: 'appOpened',
        parameters: {
          'flavor': AppConfig.instance.flavor.name,
          'os': Platform.operatingSystem,
          'version': 'getIt<PackageInfo>().version',
          'buildNumber': 'getIt<PackageInfo>().buildNumber',
          'installerStore': 'getIt<PackageInfo>().buildSignature',
          'userId': 'getIt<AppPreferences>().userId',
          'time': (DateTime.now()).toIso8601String(),
        },
      );
      // loadRemoteConfigData();

      // remoteConfig.listenWhenConfigUpdated(() {
      //   loadRemoteConfigData();
      // });
    } catch (error) {
      printer("ErrorFirebaseAnalytics", color: ConsoleColor.red);
    }
  }

  // void getUserModelFromLocalDataBase() async {
  //   localStateHelper(
  //     callback: () async {
  //       UserModel? userModel = await localDataSource.getUserModel();
  //       safeEmit(
  //         state.copyWith(uiState: UiState.succeed, userModel: userModel),
  //       );
  //     },
  //   );
  // }

  void localStateHelper({required VoidCallback callback}) async {
    safeEmit(state.copyWith(uiState: UiState.loading));
    try {
      callback();
    } catch (error) {
      safeEmit(state.copyWith(uiState: UiState.failed));
    }
  }

  ///TODO Try another way {di}
  Future<void> getCurrentRoute() async {
    // safeEmit(state.copyWith(uiState: UiState.loading));
    // final Routes openingRoutePath = await getIt<AppPreferences>()
    //     .getOpeningRoutePath();
    // printer(
    //   "the opening route is $openingRoutePath",
    //   color: ConsoleColor.blueBg,
    // );
    // safeEmit(
    //   state.copyWith(
    //     uiState: UiState.succeed,
    //     openingRoutePath: openingRoutePath.path,
    //   ),
    // );
    // safeEmit(state.copyWith(
    //     state: UiState.succeed, openingRoutePathPath: Routes.tempRoute.path));
  }

  // void testFireBase() async {
  //   printer("SUCCESS FireBAse++++++++++++++++++++++++++",
  //       color: ConsoleColor.brightYellow);
  //   await FirebaseFirestore.instance
  //       .collection(AppConfig.instance.flavor.name)
  //       .add({
  //     'platform': Platform.isAndroid ? "android" : "ios",
  //     'flavor': AppConfig.instance.flavor.name,
  //     "time": Timestamp.fromDate(DateTime.now())
  //   }).then((val) {
  //     printer("SUCCESS FireBAse++++++++++++++++++++++++++",
  //         color: ConsoleColor.brightYellow);
  //   }).catchError((error, err) {
  //     printer("ERROR FireBAse++++++++++++++++++++++++++",
  //         color: ConsoleColor.red);
  //     printer(error.toString(), color: ConsoleColor.red);
  //   });
  // }

  // void loadRemoteConfigData() async {
  //   final bool showLaterButton = await remoteConfig.getBool(
  //     RemoteConfigKeys.showLaterButton,
  //   );
  //   final bool showIgnoreButton = await remoteConfig.getBool(
  //     RemoteConfigKeys.showIgnoreButton,
  //   );
  //   final bool showSubscription = await remoteConfig.getBool(
  //     Platform.isIOS
  //         ? RemoteConfigKeys.showSubscriptionIos
  //         : RemoteConfigKeys.showSubscriptionAndroid,
  //   );
  //   final bool showBankPayment = await remoteConfig.getBool(
  //     Platform.isIOS
  //         ? RemoteConfigKeys.showBankPaymentIos
  //         : RemoteConfigKeys.showBankPaymentAndroid,
  //   );
  //
  //   safeEmit(
  //     state.copyWith(
  //       showLaterButton: showLaterButton,
  //       showIgnoreButton: showIgnoreButton,
  //       showSubscription: showSubscription,
  //       showBankPayment: showBankPayment,
  //     ),
  //   );
  //
  //   printer(
  //     'state.showSubscription from Cubit -------  ${state.showSubscription}',
  //     color: ConsoleColor.yellowBg,
  //   );
  // }
}
