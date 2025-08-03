// import 'dart:io';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:speed_service/app/shared/common/common_libs.dart';
//
// class AppNotificationService extends Equatable {
//   static final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
//   static final NetworkChecker networkChecker = getIt<NetworkChecker>();
//
//   static Future<void> initNotification() async {
//     await requestPermission();
//     await getDeviceToken();
//     await getIOSAPNsToken();
//   }
//
//   static Future<void> requestPermission() async {
//     if (Platform.isIOS) {
//       await firebaseMessaging.requestPermission(
//         alert: true,
//         announcement: true,
//         badge: true,
//         carPlay: true,
//         criticalAlert: true,
//         provisional: true,
//         sound: true,
//       );
//     } else {
//       await firebaseMessaging.requestPermission();
//     }
//   }
//
//   static Future<String> getDeviceToken() async {
//     if (Platform.isIOS && kDebugMode) return '';
//
//     if ((await networkChecker.isConnected).isFalse) return '';
//
//     try {
//       final String fcmToken = await firebaseMessaging.getToken() ?? '';
//       PrintManager.print("fcmToken   $fcmToken",
//           color: ConsoleColor.brightYellow);
//       return fcmToken;
//     } catch (e) {
//       PrintManager.print("FCM TOKEN ERROR : $e", color: ConsoleColor.redBg);
//       return '';
//     }
//   }
//
//   static Future<String> getIOSAPNsToken() async {
//     if ((Platform.isIOS && kDebugMode) || Platform.isAndroid) return '';
//     if ((await networkChecker.isConnected).isFalse) return '';
//     try {
//       final String apns = await firebaseMessaging.getAPNSToken() ?? '';
//       PrintManager.print("apns   $apns", color: ConsoleColor.brightYellow);
//       return apns;
//     } catch (e) {
//       PrintManager.print("APNs TOKEN ERROR : $e", color: ConsoleColor.redBg);
//       return '';
//     }
//   }
//
//   @override
//   List<Object?> get props => [firebaseMessaging];
// }
