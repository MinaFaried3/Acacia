import 'package:acacia/app/services/di/dependency_injection.dart';
import 'package:acacia/app/services/navigation/navigation_observer.dart';
import 'package:acacia/app/services/navigation/route_observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

final List<NavigatorObserver> routesObservers = [
  FirebaseAnalyticsObserver(analytics: getIt<FirebaseAnalytics>()),
  MyNavigatorObserver(),
  routeObserver,
];
