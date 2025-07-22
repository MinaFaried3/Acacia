import 'package:acacia/config/flavors/app_config.dart';
import 'package:acacia/config/flavors/flavors.dart';
import 'package:flutter/foundation.dart';

abstract class AppMode {
  static bool get prodReleaseMode =>
      AppConfig.instance.flavor.isProd && kReleaseMode;
  static bool get devMode => !prodReleaseMode;
}
