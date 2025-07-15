import 'package:acacia/common_main.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/config/flavors/app_config.dart';
import 'app/config/flavors/flavors.dart';

Future<void> main() async {
  final configuredApp = AppConfig(
    flavor: Flavor.dev,
    baseAPI: '',
    child: MyApp(),
  );

  // AppLogger().configure(LoggerConfig(
  //     enableLogging: true,
  //     customPrinter: PrettyPrinter(
  //       methodCount: 18,
  //       errorMethodCount: 12,
  //       lineLength: 150,
  //       colors: true,
  //       printEmojis: true,
  //       noBoxingByDefault: false,
  //       stackTraceBeginIndex: 0,
  //     )));

  runApp(await initMain(configuredApp));
}
