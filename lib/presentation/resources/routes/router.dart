import 'package:acacia/presentation/modules/admin/dashboard/dashboard_screen.dart';
import 'package:acacia/presentation/modules/admin/login/login_screen.dart';
import 'package:acacia/presentation/modules/shared/undefined/undefined_screen.dart';
import 'package:acacia/presentation/resources/routes/routes_builder.dart';
import 'package:acacia/presentation/resources/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> appRoutes = [
  Routes.undefined.toAppGoRoute(
    builder: (context, state) => const UndefinedScreen(),
  ),
  Routes.adminLogin.toAppGoRoute(
    builder: (context, state) => const AdminLoginScreen(),
  ),
  Routes.dashboard.toAppGoRoute(
    builder: (context, state) => const DashboardScreen(),
  ),
];

final ValueNotifier<RoutingConfig> appRoutingConfig =
    ValueNotifier<RoutingConfig>(RoutingConfig(routes: buildRoutes(appRoutes)));
