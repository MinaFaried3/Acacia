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

extension AppPlatformExtension on AppPlatform {
  bool get isAndroid => this == AppPlatform.android;
  bool get isIOS => this == AppPlatform.ios;
  bool get isWeb => this == AppPlatform.web;
  bool get isMacOS => this == AppPlatform.macos;
  bool get isWindows => this == AppPlatform.windows;
  bool get isLinux => this == AppPlatform.linux;
  bool get isUnknown => this == AppPlatform.unknown;

  String get name {
    switch (this) {
      case AppPlatform.android:
        return 'Android';
      case AppPlatform.ios:
        return 'iOS';
      case AppPlatform.web:
        return 'Web';
      case AppPlatform.macos:
        return 'macOS';
      case AppPlatform.windows:
        return 'Windows';
      case AppPlatform.linux:
        return 'Linux';
      case AppPlatform.unknown:
        return 'Unknown';
    }
  }

  bool get isMobile => isAndroid || isIOS;
}
