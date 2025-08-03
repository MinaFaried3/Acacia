// import 'dart:io';
//
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:speed_service/app/services/di/dependency_injection.dart';
// import 'package:speed_service/app/services/shared_preferences/app_preferences.dart';
// import 'package:speed_service/app/services/upgrade/upgrade_buttons_type.dart';
// import 'package:speed_service/app/shared/extensions/not_nullable_extensions.dart';
//
// abstract class UpgradeEventManger {
//   static Map<String, Object> eventParameter(UpgradeButtonsType buttonType) => {
//         'os': Platform.operatingSystem,
//         'buttonType': buttonType.name,
//         'version': getIt<PackageInfo>().version,
//         'buildNumber': getIt<PackageInfo>().buildNumber,
//         'installerStore': getIt<PackageInfo>().installerStore.orEmpty(),
//         'userId': getIt<AppPreferences>().userId,
//         'time': (DateTime.now()).toIso8601String(),
//       };
//
//   static bool onUpdatePressed() {
//     getIt<FirebaseAnalytics>().logEvent(
//         name: 'updateButtonFromUpgradeDialogPressed',
//         parameters: eventParameter(UpgradeButtonsType.updateNow));
//     return true;
//   }
//
//   static bool onLaterPressed() {
//     getIt<FirebaseAnalytics>().logEvent(
//         name: 'laterButtonFromUpgradeDialogPressed',
//         parameters: eventParameter(UpgradeButtonsType.later));
//     return true;
//   }
//
//   static bool onIgnorePressed() {
//     getIt<FirebaseAnalytics>().logEvent(
//         name: 'ignoreButtonFromUpgradeDialogPressed',
//         parameters: eventParameter(UpgradeButtonsType.ignore));
//     return true;
//   }
// }
