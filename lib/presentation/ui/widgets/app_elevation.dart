import 'package:acacia/presentation/resources/color_manager.dart';
import 'package:acacia/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class AppElevation extends StatelessWidget {
  final Widget child;
  final ShapeBorder? shape;
  final Color? color;
  final Color? shadowColor;
  final double? elevation;

  const AppElevation({
    super.key,
    required this.child,
    this.shape,
    this.color,
    this.elevation,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? AppSize.s12,
      shadowColor: shadowColor ?? AppColors.grey100,
      shape: shape,
      color: color ?? Colors.transparent,
      child: child,
    );
  }
}
