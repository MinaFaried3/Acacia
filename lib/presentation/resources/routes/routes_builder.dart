import 'package:acacia/app/config/flavors/app_config.dart';
import 'package:acacia/presentation/resources/routes/enhanced_go_route.dart';
import 'package:acacia/presentation/resources/routes/routes_manager.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> buildRoutes(List<RouteBase> customRoutes) {
  return customRoutes.map((route) {
    if (route is AppGoRoute) {
      return route.copyWithConvertedChildren(); // defined below
    } else if (route is AppShellRoute) {
      return route.copyWithConvertedChildren(); // defined below
    } else {
      return route;
    }
  }).toList();
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
