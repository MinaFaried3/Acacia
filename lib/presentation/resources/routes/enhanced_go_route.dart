import 'dart:async';

import 'package:acacia/app/config/flavors/app_config.dart';
import 'package:acacia/app/shared/enums/user_role.dart';
import 'package:acacia/presentation/resources/routes/routes_builder.dart';
import 'package:acacia/presentation/resources/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppGoRoute extends GoRoute {
  final List<UserRole> allowedRoles;
  final FutureOr<String?> Function(BuildContext, GoRouterState)?
  externalRedirect;

  AppGoRoute({
    required super.path,
    required super.name,
    super.builder,
    super.pageBuilder,
    super.parentNavigatorKey,
    this.externalRedirect,
    super.onExit,
    super.caseSensitive = true,
    super.routes = const <RouteBase>[],
    required this.allowedRoles,
  });

  GoRoute copyWithConvertedChildren() {
    return GoRoute(
      path: path,
      name: name,
      builder: builder,
      pageBuilder: pageBuilder,
      parentNavigatorKey: parentNavigatorKey,
      redirect: (context, state) async {
        final userRole = AppConfig.instance.currentRole.value;
        if (!allowedRoles.contains(userRole)) {
          return Routes.undefined.path;
        }
        return await externalRedirect?.call(context, state);
      },
      onExit: onExit,
      caseSensitive: caseSensitive,
      routes: buildRoutes(routes), // Convert children recursively
    );
  }
}

class AppShellRoute extends ShellRoute {
  final List<UserRole> allowedRoles;
  final FutureOr<String?> Function(BuildContext, GoRouterState)?
  externalRedirect;

  AppShellRoute({
    this.externalRedirect,
    super.builder,
    super.pageBuilder,
    super.observers,
    required super.routes,
    super.parentNavigatorKey,
    super.navigatorKey,
    super.restorationScopeId,
    required this.allowedRoles,
  });

  ShellRoute copyWithConvertedChildren() {
    return ShellRoute(
      builder: builder,
      pageBuilder: pageBuilder,
      parentNavigatorKey: parentNavigatorKey,
      navigatorKey: navigatorKey,
      observers: observers,
      restorationScopeId: restorationScopeId,
      routes: buildRoutes(routes), // Convert children recursively
      redirect: (context, state) async {
        final userRole = AppConfig.instance.currentRole.value;
        if (!allowedRoles.contains(userRole)) {
          return Routes.undefined.path;
        }
        return await externalRedirect?.call(context, state);
      },
    );
  }
}
