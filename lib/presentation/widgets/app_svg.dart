import 'package:acacia/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSvg extends StatelessWidget {
  const AppSvg({
    super.key,
    required this.path,
    this.fit,
    this.width,
    this.height,
    this.color = ColorsManager.offWhite,
    this.matchTextDirection = true,
  });

  final String path;
  final double? width, height;
  final Color color;
  final bool matchTextDirection;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      matchTextDirection: matchTextDirection,
      height: height,
      width: width,
      fit: fit ?? BoxFit.contain,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
