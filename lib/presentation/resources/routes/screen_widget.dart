import 'package:acacia/presentation/resources/routes/routes_manager.dart';
import 'package:flutter/material.dart';

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({super.key, required this.child, required this.route});

  final Widget child;
  final Routes route;

  @override
  Widget build(BuildContext context) {
    return child;

    // return ConditionalBuilder(
    //     condition: RouteGenerator.startEntryRoutes.contains(route),
    //     onTrue: (context) {
    //       printer(
    //           'this is Opened Route a Upgrade Checker will work Now',
    //           color: ConsoleColor.brightBlue);
    //       return BlocBuilder<LocalCubit, LocalState>(
    //         builder: (context, state) {
    //           return AppUpgradeAlert(
    //             showIgnore: state.showIgnoreButton,
    //             showLater: state.showLaterButton,
    //             onUpdate: UpgradeEventManger.onUpdatePressed,
    //             onLater: UpgradeEventManger.onLaterPressed,
    //             onIgnore: UpgradeEventManger.onIgnorePressed,
    //             child: child,
    //           );
    //         },
    //       );
    //     },
    //     onFalse: (context) => child);
  }
}
