import 'package:acacia/presentation/widgets/animation/route/size_page_route.dart';
import 'package:flutter/material.dart';

class VerticalSizePageRoute extends SizePageRoute {
  VerticalSizePageRoute({
    required super.builder,
    super.duration,
    super.reverseDuration,
    super.transitionColor,
    super.voiceLabel,
    super.alignment,
    super.curve,
  }) : super(axis: Axis.vertical);
}

class VerticalSizeTransitionPage<T> extends SizeTransitionPage<T> {
  VerticalSizeTransitionPage({
    required super.key,
    required super.child,
    super.duration,
    super.reverseDuration,
    super.barrierColor, // ✅ replaces transitionColor
    super.barrierLabel, // ✅ replaces voiceLabel
    super.alignment,
    super.curve,
  }) : super(axis: Axis.vertical);
}
