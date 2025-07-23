import 'package:acacia/config/platform/platform.dart';
import 'package:acacia/firebase_options_dev.dart' as dev;
import 'package:acacia/firebase_options_prod.dart' as prod;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'flavors.dart';

class AppConfig extends InheritedWidget {
  final Flavor flavor;
  final String baseAPI;
  late final AppPlatform platform;

  static late final AppConfig instance;

  AppConfig({
    super.key,
    required this.flavor,
    required this.baseAPI,
    required super.child,
  }) {
    platform = currentPlatform;
    instance = this;
  }

  FirebaseOptions get fireBaseOptions {
    return flavor.isDev
        ? dev.DefaultFirebaseOptions.currentPlatform
        : prod.DefaultFirebaseOptions.currentPlatform;
  }

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>(
      aspect: AppConfig,
    );
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
