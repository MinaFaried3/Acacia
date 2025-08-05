import 'dart:async';

import 'package:acacia/app/shared/enums/user_role.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'enhanced_go_route.dart';

class RouteData extends Equatable {
  final String name;
  final String path;
  final List<UserRole> allowedRoles;

  const RouteData({
    required this.name,
    required this.path,
    required this.allowedRoles,
  });

  AppGoRoute toAppGoRoute({
    Widget Function(BuildContext, GoRouterState)? builder,
    Page<dynamic> Function(BuildContext, GoRouterState)? pageBuilder,
    GlobalKey<NavigatorState>? parentNavigatorKey,
    FutureOr<String?> Function(BuildContext, GoRouterState)? externalRedirect,
    FutureOr<bool> Function(BuildContext, GoRouterState)? onExit,
    bool caseSensitive = true,
    List<RouteBase> routes = const <RouteBase>[],
  }) {
    return AppGoRoute(
      name: name,
      path: path,
      allowedRoles: allowedRoles,
      builder: builder,
      pageBuilder: pageBuilder,
      parentNavigatorKey: parentNavigatorKey,
      externalRedirect: externalRedirect,
      onExit: onExit,
      caseSensitive: caseSensitive,
      routes: routes,
    );
  }

  @override
  List<Object> get props => [name, path, allowedRoles];

  @override
  String toString() {
    return 'RouteData{name: $name, path: $path, allowedRoles: $allowedRoles}';
  }
}
