import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:flutter/material.dart';

class MyNavigatorObserver extends NavigatorObserver {
  static final List<Route<dynamic>> routeStack = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    routeStack.add(route);
    printRouteStack();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    routeStack.remove(route);
    printRouteStack();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    routeStack.remove(route);
    printRouteStack();
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (oldRoute != null) {
      routeStack.remove(oldRoute);
    }
    if (newRoute != null) {
      routeStack.add(newRoute);
    }
    printRouteStack();
  }

  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) {
    super.didStartUserGesture(route, previousRoute);
    PrintManager.print(
      "User gesture started on route: ${_getRouteName(route)}",
      color: ConsoleColor.yellow,
    );
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
    PrintManager.print("User gesture stopped.", color: ConsoleColor.yellow);
  }

  /// Prints the current route stack, using route settings names or defaulting to runtime type.
  void printRouteStack() {
    PrintManager.print(
      "routeStack => ${routeStack.map((r) => _getRouteName(r)).toList()}",
      color: ConsoleColor.blue,
    );
  }

  /// Checks if a specific route name exists in the stack.
  bool hasRoute(String routeName) {
    return routeStack.any((route) => _getRouteName(route) == routeName);
  }

  /// Resolves the route name from settings or provides a fallback.
  String _getRouteName(Route<dynamic> route) {
    return route.settings.name ?? _fallbackRouteName(route);
  }

  /// Provides a fallback name if no explicit name is available.
  String _fallbackRouteName(Route<dynamic> route) {
    // Map runtime types to your route names or return type as a fallback.

    return route.runtimeType.toString();
  }
}
