import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/config/flavors/app_config.dart';
import 'app/config/flavors/flavors.dart';
import 'common_main.dart';

Future<void> main() async {
  final configuredApp = AppConfig(
    flavor: Flavor.prod,
    baseAPI: '',
    child: MyApp(),
  );

  runApp(await initMain(configuredApp));
}
