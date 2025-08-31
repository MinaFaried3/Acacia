import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SizePageRoute extends PageRouteBuilder {
  final WidgetBuilder builder;
  final Duration duration;
  final Duration reverseDuration;
  final Color? transitionColor;
  final String? voiceLabel;
  final AlignmentGeometry alignment; // Customizable alignment
  final Axis axis; // Customizable axis
  final Curve curve; // Customizable curve

  SizePageRoute({
    required this.builder,
    this.duration = const Duration(seconds: 5),
    this.reverseDuration = const Duration(milliseconds: 100),
    this.transitionColor,
    this.voiceLabel,
    this.alignment = Alignment.center, // Default alignment
    this.axis = Axis.vertical, // Default axis
    this.curve = Curves.easeOut, // Default curve
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) =>
             builder(context),
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           final curvedAnimation = CurvedAnimation(
             parent: animation,
             curve: curve,
           );

           return Align(
             alignment: alignment,
             child: SizeTransition(
               axis: axis,
               sizeFactor: curvedAnimation,
               child: child,
             ),
           );
         },
         transitionDuration: duration,
         reverseTransitionDuration: reverseDuration,
         barrierColor: transitionColor,
         barrierLabel: voiceLabel, // renamed to voiceLabel
       );
}

class SizeTransitionPage<T> extends CustomTransitionPage<T> {
  SizeTransitionPage({
    required LocalKey super.key,
    required super.child,
    Duration duration = const Duration(milliseconds: 500),
    Duration reverseDuration = const Duration(milliseconds: 100),
    Curve curve = Curves.easeOut,
    Axis axis = Axis.vertical,
    Alignment alignment = Alignment.center,
    super.barrierColor,
    super.barrierLabel,
  }) : super(
         transitionDuration: duration,
         reverseTransitionDuration: reverseDuration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           final curved = CurvedAnimation(parent: animation, curve: curve);

           return Align(
             alignment: alignment,
             child: SizeTransition(
               axis: axis,
               sizeFactor: curved,
               child: child,
             ),
           );
         },
       );
}

class SizeTransitionPresets {
  static SizeTransitionPage<T> vertical<T>(Widget child, GoRouterState state) {
    return SizeTransitionPage(
      key: state.pageKey,
      child: child,
      axis: Axis.vertical,
    );
  }

  static SizeTransitionPage<T> horizontal<T>(
    Widget child,
    GoRouterState state,
  ) {
    return SizeTransitionPage(
      key: state.pageKey,
      child: child,
      axis: Axis.horizontal,
      alignment: Alignment.centerRight,
    );
  }
}
