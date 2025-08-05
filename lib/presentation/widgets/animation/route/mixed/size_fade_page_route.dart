import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SizeFadePageRoute extends PageRouteBuilder {
  final WidgetBuilder builder;
  final Duration duration;
  final Duration reverseDuration;
  final AlignmentGeometry alignment;
  final Curve curve; // New curve parameter
  final Color? transitionColor;
  final String? voiceLabel;

  SizeFadePageRoute({
    required this.builder,
    this.duration = const Duration(milliseconds: 500),
    this.reverseDuration = const Duration(milliseconds: 100),
    this.alignment = Alignment.center,
    this.curve = Curves.easeInOut, // Default curve
    this.transitionColor,
    this.voiceLabel,
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) =>
             builder(context),
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           // Apply the curve to the animation
           final curvedAnimation = CurvedAnimation(
             parent: animation,
             curve: curve,
           );

           return Align(
             alignment: alignment,
             child: SizeTransition(
               sizeFactor: curvedAnimation, // Use curved animation here
               child: FadeTransition(
                 opacity: curvedAnimation, // Use curved animation here
                 child: child,
               ),
             ),
           );
         },
         transitionDuration: duration,
         reverseTransitionDuration: reverseDuration,
         barrierColor: transitionColor,
         barrierLabel: voiceLabel,
       );
}

class SizeFadeTransitionPage<T> extends CustomTransitionPage<T> {
  SizeFadeTransitionPage({
    required super.key,
    required super.child,
    Duration duration = const Duration(milliseconds: 500),
    Duration reverseDuration = const Duration(milliseconds: 100),
    AlignmentGeometry alignment = Alignment.center,
    Curve curve = Curves.easeInOut,
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
               sizeFactor: curved,
               child: FadeTransition(opacity: curved, child: child),
             ),
           );
         },
       );
}
