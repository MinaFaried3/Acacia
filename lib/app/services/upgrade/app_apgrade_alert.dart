// import 'dart:io';
//
// import 'package:speed_service/app/shared/common/common_libs.dart';
// import 'package:upgrader/upgrader.dart';
//
// class AppUpgradeAlert extends UpgradeAlert {
//   AppUpgradeAlert(
//       {super.key,
//       super.upgrader,
//       super.barrierDismissible,
//       super.cupertinoButtonTextStyle,
//       super.dialogKey,
//       super.dialogStyle,
//       super.navigatorKey,
//       super.onIgnore,
//       super.onLater,
//       super.onUpdate,
//       super.shouldPopScope,
//       super.showIgnore,
//       super.showLater,
//       super.showReleaseNotes,
//       super.child});
//
//   /// Override the [createState] method to provide a custom class
//   /// with overridden methods.
//   @override
//   UpgradeAlertState createState() => MyUpgradeAlertState();
// }
//
// class MyUpgradeAlertState extends UpgradeAlertState {
//   @override
//   Widget alertDialog(
//       Key? key,
//       String title,
//       String message,
//       String? releaseNotes,
//       BuildContext context,
//       bool cupertino,
//       UpgraderMessages messages) {
//     return Theme(
//       data: ThemeData(
//         dialogTheme: DialogTheme(
//           titleTextStyle:
//               get400RegularStyle(color: ColorsManager.redPrimary, fontSize: 30),
//           contentTextStyle: get300LightStyle(
//               color: ColorsManager.darkBlueTextSecondary, fontSize: 18),
//         ),
//         textButtonTheme: const TextButtonThemeData(
//           style: ButtonStyle(
//             // Change the color of the text buttons.
//             foregroundColor: WidgetStatePropertyAll(ColorsManager.redPrimary),
//           ),
//         ),
//       ),
//       child: super.alertDialog(key, AppStrings.appTitle.tr(), message,
//           releaseNotes, context, Platform.isIOS, messages),
//     );
//   }
// }
