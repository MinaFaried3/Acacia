import 'package:acacia/app/config/flavors/app_config.dart';
import 'package:acacia/app/shared/enums/user_role.dart';
import 'package:acacia/presentation/resources/routes/routes_manager.dart';
import 'package:acacia/presentation/resources/routes/undefined_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'enhanced_go_route.dart';

final List<RouteBase> appRoutes = [
  AppGoRoute(
    path: RoutesStrings.unDefinedRoute,
    builder: (context, state) => UndefinedScreen(title: 'undifiend'),
    allowedRoles: [UserRole.guest],
  ),
  AppGoRoute(
    path: RoutesStrings.loginRoute,
    builder: (context, state) => UndefinedScreen(title: 'login'),
    allowedRoles: [UserRole.admin],
  ),
  AppShellRoute(
    routes: [
      AppGoRoute(
        path: RoutesStrings.unDefinedRoute,
        builder: (context, state) => UndefinedScreen(title: 'undifiend'),
        allowedRoles: [UserRole.guest],
      ),
      AppGoRoute(
        path: RoutesStrings.loginRoute,
        builder: (context, state) => UndefinedScreen(title: 'login'),
        allowedRoles: [UserRole.admin],
      ),
    ],
    allowedRoles: [UserRole.admin],
  ),
];

final ValueNotifier<RoutingConfig> appRoutingConfig =
    ValueNotifier<RoutingConfig>(
      RoutingConfig(
        routes: appRoutes,
        redirect: (context, GoRouterState state) {
          final userRole = AppConfig.instance.currentRole.value;

          return null; // No redirection needed
        },
      ),
    );

//todo admin routes
