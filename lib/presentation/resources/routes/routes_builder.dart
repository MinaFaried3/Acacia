import 'package:acacia/presentation/resources/routes/enhanced_go_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> buildRoutes(List<RouteBase> routes) {
  return routes.map((route) {
    // Handle AppGoRoute → GoRoute with permission check
    if (route is AppGoRoute) {
      return route.copyWithConvertedChildren();
    }

    // Handle AppShellRoute → ShellRoute with permission check
    if (route is AppShellRoute) {
      return route.copyWithConvertedChildren();
    }

    // Handle StatefulShellRoute → with recursive branch conversion
    if (route is StatefulShellRoute) {
      return _convertStatefulShellRoute(route);
    }

    // Default route (GoRoute, ShellRoute, etc.) — recurse children
    if (route is GoRoute) {
      return GoRoute(
        path: route.path,
        name: route.name,
        builder: route.builder,
        pageBuilder: route.pageBuilder,
        parentNavigatorKey: route.parentNavigatorKey,
        redirect: route.redirect,
        onExit: route.onExit,
        caseSensitive: route.caseSensitive,
        routes: buildRoutes(route.routes), // recurse
      );
    }

    if (route is ShellRoute) {
      return ShellRoute(
        builder: route.builder,
        pageBuilder: route.pageBuilder,
        parentNavigatorKey: route.parentNavigatorKey,
        navigatorKey: route.navigatorKey,
        observers: route.observers,
        restorationScopeId: route.restorationScopeId,
        routes: buildRoutes(route.routes), // recurse
        redirect: route.redirect,
      );
    }

    return route;
  }).toList();
}

StatefulShellRoute _convertStatefulShellRoute(
  StatefulShellRoute original, {
  GlobalKey<StatefulNavigationShellState>? key,
}) {
  return StatefulShellRoute.indexedStack(
    builder: original.builder,
    key: key,
    pageBuilder: original.pageBuilder,
    parentNavigatorKey: original.parentNavigatorKey,
    restorationScopeId: original.restorationScopeId,
    redirect: original.redirect,
    branches: original.branches.map((branch) {
      return StatefulShellBranch(
        navigatorKey: branch.navigatorKey,
        observers: branch.observers,
        restorationScopeId: branch.restorationScopeId,
        routes: buildRoutes(branch.routes), // recurse into children
        initialLocation: branch.initialLocation,
        preload: branch.preload,
      );
    }).toList(),
  );
}
