import 'package:flutter/foundation.dart';

enum AppPlatform { android, ios, web, macos, windows, linux, unknown }

AppPlatform get currentPlatform {
  if (kIsWeb) {
    return AppPlatform.web;
  }
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      return AppPlatform.android;
    case TargetPlatform.iOS:
      return AppPlatform.ios;
    case TargetPlatform.macOS:
      return AppPlatform.macos;
    case TargetPlatform.windows:
      return AppPlatform.windows;
    case TargetPlatform.linux:
      return AppPlatform.linux;
    default:
      throw UnsupportedError('Current platform is not supported.');
  }
}
