import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScalePageRoute extends PageRouteBuilder {
  final WidgetBuilder builder;
  final Duration duration;
  final Duration reverseDuration;
  final Curve curve;
  final Color? transitionColor;
  final String? voiceLabel;
  final Tween<double>? tween;

  ScalePageRoute({
    required this.builder,
    this.duration = const Duration(milliseconds: 500),
    this.reverseDuration = const Duration(milliseconds: 100),
    this.curve = Curves.easeOut,
    this.tween,
    this.transitionColor,
    this.voiceLabel,
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) =>
             builder(context),
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           final currentTween = tween ?? Tween<double>(begin: 0, end: 1.0);

           Animation<double> animationDouble = currentTween.animate(
             CurvedAnimation(parent: animation, curve: curve),
           );

           return ScaleTransition(scale: animationDouble, child: child);
         },
         transitionDuration: duration,
         reverseTransitionDuration: reverseDuration,
         barrierColor: transitionColor,
         barrierLabel: voiceLabel,
       );
}

class ScaleTransitionPage<T> extends CustomTransitionPage<T> {
  ScaleTransitionPage({
    required LocalKey super.key,
    required super.child,
    Duration duration = const Duration(milliseconds: 500),
    Duration reverseDuration = const Duration(milliseconds: 100),
    Curve curve = Curves.easeOut,
    Tween<double>? tween,
    super.barrierColor,
    super.barrierLabel,
  }) : super(
         transitionDuration: duration,
         reverseTransitionDuration: reverseDuration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           final curved = CurvedAnimation(parent: animation, curve: curve);

           final scaleAnimation = (tween ?? Tween<double>(begin: 0.0, end: 1.0))
               .animate(curved);

           return ScaleTransition(scale: scaleAnimation, child: child);
         },
       );
}

class ScaleTransitionPresets {
  static ScaleTransitionPage<T> normal<T>(Widget child, GoRouterState state) {
    return ScaleTransitionPage(key: state.pageKey, child: child);
  }

  static ScaleTransitionPage<T> bounce<T>(Widget child, GoRouterState state) {
    return ScaleTransitionPage(
      key: state.pageKey,
      child: child,
      curve: Curves.elasticOut,
      tween: Tween<double>(begin: 0.7, end: 1.0),
    );
  }
}
