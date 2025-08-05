import 'dart:async';

import 'package:acacia/app/shared/enums/user_role.dart';
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
}
