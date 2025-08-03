import 'package:acacia/presentation/widgets/animation/route/slide_page_route.dart';
import 'package:flutter/material.dart';

class BottomSlidePageRoute extends SlidePageRoute {
  BottomSlidePageRoute({
    required super.builder,
    super.duration,
    super.reverseDuration,
    super.curve,
    super.transitionColor,
    super.voiceLabel,
  }) : super(
         tweenOffset: Tween<Offset>(
           begin: const Offset(0, 1),
           end: Offset.zero,
         ),
       );
}
