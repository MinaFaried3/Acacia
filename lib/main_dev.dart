import 'package:acacia/app/config/flavors/app_config.dart';
import 'package:acacia/app/config/flavors/flavors.dart';
import 'package:acacia/common_main.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

Future<void> main() async {
  final configuredApp = AppConfig(
    flavor: Flavor.dev,
    baseAPI: '',
    child: MyApp(),
  );

  runApp(await initMain(configuredApp));
}
