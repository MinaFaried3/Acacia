import 'package:acacia/app/config/flavors/flavors.dart';
import 'package:flutter/foundation.dart';

import 'flavors/app_config.dart';

abstract class AppMode {
  static bool get prodReleaseMode =>
      AppConfig.instance.flavor.isProd && kReleaseMode;
  static bool get devMode => !prodReleaseMode;
}
