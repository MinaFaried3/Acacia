import 'package:acacia/app/services/navigation/navigation_observer.dart';
import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    PrintManager.print(
      ModalRoute.of(this)?.settings.name,
      color: ConsoleColor.blue,
    );
    PrintManager.print(routeName, color: ConsoleColor.blue);
    // Check if the current route name matches the one you want to push

    if (ModalRoute.of(this)?.settings.name == routeName ||
        routeName == MyNavigatorObserver.routeStack.last.settings.name) {
      PrintManager.print(
        'not navigate to same route',
        color: ConsoleColor.blue,
      );
      return Future.value(null);
    }
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    RoutePredicate? predicate,
  }) {
    return Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      predicate ?? (route) => false,
      arguments: arguments,
    );
  }

  Future<dynamic> push(Widget screen) {
    return Navigator.of(
      this,
    ).push(MaterialPageRoute(builder: (context) => screen));
  }

  Future<dynamic> pushReplacement(Widget screen) {
    return Navigator.of(
      this,
    ).pushReplacement(MaterialPageRoute(builder: (context) => screen));
  }

  Future<dynamic> pushAndRemoveUntil(Widget screen) {
    return Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => screen),
      (route) => false,
    );
  }

  //pop
  void pop() => Navigator.of(this).pop();

  bool canPop() => Navigator.canPop(this);
}
