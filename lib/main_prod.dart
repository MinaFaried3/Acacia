import 'package:acacia/app/app.dart';
import 'package:acacia/app/config/flavors/app_config.dart';
import 'package:acacia/app/config/flavors/flavors.dart';
import 'package:acacia/common_main.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  final configuredApp = AppConfig(
    flavor: Flavor.prod,
    baseAPI: '',
    child: MyApp(),
  );

  runApp(await initMain(configuredApp));
}
