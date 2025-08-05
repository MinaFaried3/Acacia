import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlidePageRoute extends PageRouteBuilder {
  final WidgetBuilder builder;
  final Duration duration;
  final Duration reverseDuration;
  final Curve curve;
  final Tween<Offset>? tweenOffset;
  final Color? transitionColor;
  final String? voiceLabel;

  SlidePageRoute({
    required this.builder,
    this.duration = const Duration(milliseconds: 500),
    this.reverseDuration = const Duration(milliseconds: 100),
    this.tweenOffset,
    this.curve = Curves.easeOut,
    this.transitionColor,
    this.voiceLabel,
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) =>
             builder(context),
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           var curvedAnimation = CurvedAnimation(
             parent: animation,
             curve: curve,
           );

           var tween =
               tweenOffset ??
               Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero);

           var offsetAnimation = curvedAnimation.drive(tween);

           return SlideTransition(position: offsetAnimation, child: child);
         },
         transitionDuration: duration,
         reverseTransitionDuration: reverseDuration,
         barrierColor: transitionColor,
         barrierLabel: voiceLabel, // renamed to voiceLabel
       );
}

class SlideTransitionPage<T> extends CustomTransitionPage<T> {
  SlideTransitionPage({
    required LocalKey
    super.key, // 👈 Force router-managed key (e.g. state.pageKey)
    required super.child,
    Duration duration = const Duration(milliseconds: 500),
    Duration reverseDuration = const Duration(milliseconds: 100),
    Curve curve = Curves.easeOut,
    Tween<Offset>? tweenOffset,
    Alignment alignment = Alignment.center,
    super.barrierColor,
    super.barrierLabel,
  }) : super(
         transitionDuration: duration,
         reverseTransitionDuration: reverseDuration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           final curvedAnimation = CurvedAnimation(
             parent: animation,
             curve: curve,
           );

           final offsetAnimation = curvedAnimation.drive(
             tweenOffset ??
                 Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero),
           );

           return Align(
             alignment: alignment,
             child: SlideTransition(position: offsetAnimation, child: child),
           );
         },
       );
}

class SlideTransitionPresets {
  static SlideTransitionPage<T> fromRight<T>(
    Widget child,
    GoRouterState state,
  ) {
    return SlideTransitionPage(
      key: state.pageKey,
      child: child,
      tweenOffset: Tween(begin: const Offset(1, 0), end: Offset.zero),
    );
  }

  static SlideTransitionPage<T> fromBottom<T>(
    Widget child,
    GoRouterState state,
  ) {
    return SlideTransitionPage(
      key: state.pageKey,
      child: child,
      tweenOffset: Tween(begin: const Offset(0, 1), end: Offset.zero),
    );
  }

  static SlideTransitionPage<T> fromLeft<T>(Widget child, GoRouterState state) {
    return SlideTransitionPage(
      key: state.pageKey,
      child: child,
      tweenOffset: Tween(begin: const Offset(-1, 0), end: Offset.zero),
    );
  }
}
