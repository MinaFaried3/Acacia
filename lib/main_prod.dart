import 'package:acacia/common_main.dart';
import 'package:flutter/material.dart';

import 'config/flavors/app_config.dart';
import 'config/flavors/flavors.dart';
import 'main.dart';

Future<void> main() async {
  final configuredApp = AppConfig(
    flavor: Flavor.prod,
    baseAPI: '',
    child: MyApp(),
  );

  runApp(await initMain(configuredApp));
}
