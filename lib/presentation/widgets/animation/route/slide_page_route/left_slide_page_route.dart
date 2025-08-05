import 'package:acacia/presentation/widgets/animation/route/slide_page_route.dart';
import 'package:flutter/material.dart';

class LeftSlidePageRoute extends SlidePageRoute {
  LeftSlidePageRoute({
    required super.builder,
    super.duration,
    super.reverseDuration,
    super.curve,
    super.transitionColor,
    super.voiceLabel,
  }) : super(
         tweenOffset: Tween<Offset>(
           begin: const Offset(-1, 0),
           end: Offset.zero,
         ),
       );
}

class LeftSlideTransitionPage<T> extends SlideTransitionPage<T> {
  LeftSlideTransitionPage({
    required super.key,
    required super.child,
    super.duration,
    super.reverseDuration,
    super.curve,
    super.barrierColor, // ✅ FIXED
    super.barrierLabel,
  }) : super(
         tweenOffset: Tween<Offset>(
           begin: const Offset(-1, 0),
           end: Offset.zero,
         ),
       );
}
