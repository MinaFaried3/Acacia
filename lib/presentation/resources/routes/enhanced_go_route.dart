import 'dart:async';

import 'package:acacia/app/config/flavors/app_config.dart';
import 'package:acacia/app/shared/enums/user_role.dart';
import 'package:acacia/app/shared/extensions/bool_extension.dart';
import 'package:acacia/presentation/resources/routes/go_router_layer.dart';
import 'package:acacia/presentation/resources/routes/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppGoRoute extends GoRoute {
  final List<UserRole> allowedRoles;
  final FutureOr<String?> Function(BuildContext, GoRouterState)?
  externalRedirect;
  AppGoRoute({
    required super.path,
    super.name,
    super.builder,
    super.pageBuilder,
    super.parentNavigatorKey,
    this.externalRedirect,
    super.onExit,
    super.caseSensitive = true,
    super.routes = const <RouteBase>[],
    required this.allowedRoles,
  });

  GoRoute toGoRoute() {
    return GoRoute(
      path: path,
      name: name,
      builder: builder,
      pageBuilder: pageBuilder,
      parentNavigatorKey: parentNavigatorKey,
      redirect: (context, state) async {
        final userRole = AppConfig.instance.currentRole.value;

        if (allowedRoles.contains(userRole).isFalse) {
          return RoutesStrings.unDefinedRoute;
        }

        return await externalRedirect?.call(context, state);
      },
      onExit: onExit,
      caseSensitive: caseSensitive,
      routes: routes,
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

  ShellRoute toShellRoute() {
    return ShellRoute(
      redirect: (context, state) async {
        final userRole = AppConfig.instance.currentRole.value;

        if (allowedRoles.contains(userRole).isFalse) {
          return RoutesStrings.unDefinedRoute;
        }

        return await externalRedirect?.call(context, state);
      },
      builder: builder,
      pageBuilder: pageBuilder,
      observers: observers,
      routes: routes,
      parentNavigatorKey: parentNavigatorKey,
      navigatorKey: navigatorKey,
      restorationScopeId: restorationScopeId,
    );
  }
}

extension AppGoRouteExtensions on AppGoRoute {
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
          return RoutesStrings.unDefinedRoute;
        }
        return await externalRedirect?.call(context, state);
      },
      onExit: onExit,
      caseSensitive: caseSensitive,
      routes: buildRoutes(routes), // Convert children recursively
    );
  }
}

extension AppShellRouteExtensions on AppShellRoute {
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
          return RoutesStrings.unDefinedRoute;
        }
        return await externalRedirect?.call(context, state);
      },
    );
  }
}
