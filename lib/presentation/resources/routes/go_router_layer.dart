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

//todo admin routes
// List<RouteBase> generateRoutes(AuthCubit authCubit) {
//   return protectedRoutes.map((route) {
//     return GoRoute(
//       path: route.path,
//       name: route.name,
//       builder: route.builder,
//
//       redirect: (context, state) {
//         final auth = authCubit.state;
//
//         if (!auth.isAuthenticated) return '/login';
//
//         if (!route.allowedRoles.contains(auth.role)) {
//           return '/unauthorized';
//         }
//
//         return null;
//       },
//     );
//   }).toList();
// }
