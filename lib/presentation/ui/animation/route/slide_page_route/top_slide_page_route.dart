import 'package:acacia/presentation/ui/animation/route/slide_page_route.dart';
import 'package:flutter/material.dart';

class TopSlidePageRoute extends SlidePageRoute {
  TopSlidePageRoute({
    required super.builder,
    super.duration,
    super.reverseDuration,
    super.curve,
    super.transitionColor,
    super.voiceLabel,
  }) : super(
         tweenOffset: Tween<Offset>(
           begin: const Offset(0, -1),
           end: Offset.zero,
         ),
       );
}

class TopSlideTransitionPage<T> extends SlideTransitionPage<T> {
  TopSlideTransitionPage({
    required super.key,
    required super.child,
    super.duration,
    super.reverseDuration,
    super.curve,
    super.barrierColor,
    super.barrierLabel,
  }) : super(
         tweenOffset: Tween<Offset>(
           begin: const Offset(0, -1),
           end: Offset.zero,
         ),
       );
}
