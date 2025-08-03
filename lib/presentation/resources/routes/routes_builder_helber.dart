import 'dart:io';

import 'package:acacia/app/shared/extensions/empty_or_null.dart';
import 'package:acacia/presentation/resources/routes/routes_manager.dart';
import 'package:acacia/presentation/resources/routes/screen_widget.dart';
import 'package:acacia/presentation/widgets/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

PageRoute buildAppPageRoute({
  required WidgetBuilder screenBuilder,
  required Routes route,
}) {
  return Platform.isIOS
      ? CupertinoPageRoute(
          builder: screenBuilder,
          settings: RouteSettings(name: route.path),
        )
      : MaterialPageRoute(
          builder: screenBuilder,
          settings: RouteSettings(name: route.path),
        );
}

Widget buildRouteScreenWithProviders({
  required List<BlocProvider> Function()? providers,
  required Widget screen,
  required Routes route,
}) {
  return ConditionalBuilder(
    condition: providers.isNotNull,
    onTrue: (context) => MultiBlocProvider(
      providers: providers!(),
      child: buildScreenWidget(route, screen),
    ),
    onFalse: (context) => buildScreenWidget(route, screen),
  );
}

ScreenWidget buildScreenWidget(Routes route, Widget screen) {
  return ScreenWidget(route: route, child: screen);
}

/// ### buildRoute `params`
/// [providers] should be function not List because of order of steps maybe this list providers depend on some logic must prepare first at DI module so that's way will ensure the order of execution process
PageRoute buildRoute({
  VoidCallback? prepareModule,
  List<BlocProvider> Function()? providers,
  required Widget screen,
  required Routes route,
}) {
  if (prepareModule.isNotNull) prepareModule!();

  return buildAppPageRoute(
    route: route,
    screenBuilder: (_) => buildRouteScreenWithProviders(
      providers: providers,
      screen: screen,
      route: route,
    ),
  );
}
