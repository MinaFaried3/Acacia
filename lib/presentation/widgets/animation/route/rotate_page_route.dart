import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RotatePageRoute extends PageRouteBuilder {
  final WidgetBuilder builder;
  final Duration duration;
  final Duration reverseDuration;
  final Curve curve;
  final Color? transitionColor;
  final String? voiceLabel;
  final double rotateCount;
  final Tween<double>? tween;

  RotatePageRoute({
    required this.builder,
    this.duration = const Duration(milliseconds: 500),
    this.reverseDuration = const Duration(milliseconds: 100),
    this.curve = Curves.easeOut,
    this.rotateCount = 1,
    this.tween,
    this.transitionColor,
    this.voiceLabel,
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) =>
             builder(context),
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           final currentTween =
               tween ?? Tween<double>(begin: 0, end: rotateCount);

           Animation<double> animationDouble = currentTween.animate(
             CurvedAnimation(parent: animation, curve: curve),
           );

           return RotationTransition(turns: animationDouble, child: child);
         },
         transitionDuration: duration,
         reverseTransitionDuration: reverseDuration,
         barrierColor: transitionColor,
         barrierLabel: voiceLabel, // renamed to voiceLabel
       );
}

class RotateTransitionPage<T> extends CustomTransitionPage<T> {
  RotateTransitionPage({
    required super.key,
    required super.child,
    Duration duration = const Duration(milliseconds: 500),
    Duration reverseDuration = const Duration(milliseconds: 100),
    Curve curve = Curves.easeOut,
    double rotateCount = 1,
    Tween<double>? tween,
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

           final rotateTween =
               tween ?? Tween<double>(begin: 0, end: rotateCount);

           final rotateAnimation = rotateTween.animate(curvedAnimation);

           return RotationTransition(turns: rotateAnimation, child: child);
         },
       );
}

class RotateTransitionPresets {
  static RotateTransitionPage<T> normal<T>(Widget child, GoRouterState state) {
    return RotateTransitionPage(key: state.pageKey, child: child);
  }

  static RotateTransitionPage<T> fastSpin<T>(
    Widget child,
    GoRouterState state,
  ) {
    return RotateTransitionPage(
      key: state.pageKey,
      child: child,
      rotateCount: 2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }
}
