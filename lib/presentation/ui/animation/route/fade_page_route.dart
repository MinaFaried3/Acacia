import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FadePageRoute extends PageRouteBuilder {
  final WidgetBuilder builder;
  final AlignmentGeometry align;
  final Duration duration;
  final Duration reverseDuration;
  final Color? transitionColor;
  final String? voiceLabel;

  FadePageRoute({
    required this.builder,
    this.align = Alignment.center,
    this.duration = const Duration(milliseconds: 500),
    this.reverseDuration = const Duration(milliseconds: 100),
    this.voiceLabel,
    this.transitionColor,
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) =>
             builder(context),
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           return Align(
             alignment: align,
             child: FadeTransition(opacity: animation, child: child),
           );
         },
         transitionDuration: duration,
         reverseTransitionDuration: reverseDuration,
         barrierColor: transitionColor,
         // accessibility tools (like VoiceOver on iOS) focus on the barrier.
         barrierLabel: voiceLabel,
       );
}

class FadeTransitionPage<T> extends CustomTransitionPage<T> {
  FadeTransitionPage({
    required super.key,
    required super.child,
    Duration duration = const Duration(milliseconds: 500),
    Duration reverseDuration = const Duration(milliseconds: 100),
    AlignmentGeometry alignment = Alignment.center,
    Curve curve = Curves.linear,
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

           return Align(
             alignment: alignment,
             child: FadeTransition(opacity: curvedAnimation, child: child),
           );
         },
       );
}

class FadeTransitionPresets {
  static FadeTransitionPage<T> normal<T>(Widget child, GoRouterState state) {
    return FadeTransitionPage(key: state.pageKey, child: child);
  }

  static FadeTransitionPage<T> fast<T>(Widget child, GoRouterState state) {
    return FadeTransitionPage(
      key: state.pageKey,
      child: child,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );
  }
}
