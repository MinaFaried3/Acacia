import 'package:acacia/app/shared/extensions/empty_or_null.dart';
import 'package:acacia/presentation/ui/widgets/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// PageRoute buildAppPageRoute({required WidgetBuilder screenBuilder}) {
//   return Platform.isIOS
//       ? CupertinoPageRoute(builder: screenBuilder)
//       : MaterialPageRoute(builder: screenBuilder);
// }

Widget buildRouteScreenWithProviders({
  required List<BlocProvider> Function()? providers,
  required WidgetBuilder screen,
}) {
  return ConditionalBuilder(
    condition: providers.isNotNull && providers!().isNotEmpty,
    onTrue: (context) =>
        MultiBlocProvider(providers: providers!(), child: screen(context)),
    onFalse: screen,
  );
}

/// ### buildRoute `params`
/// [providers] should be function not List because of order of steps maybe this list providers depend on some logic must prepare first at DI module so that's way will ensure the order of execution process
Widget buildAppRoute({
  VoidCallback? prepareModule,
  List<BlocProvider> Function()? providers,
  required WidgetBuilder screen,
}) {
  if (prepareModule.isNotNull) prepareModule!();

  return buildRouteScreenWithProviders(providers: providers, screen: screen);
}
