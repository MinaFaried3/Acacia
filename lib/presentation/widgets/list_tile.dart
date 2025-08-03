import 'package:acacia/presentation/resources/color_manager.dart';
import 'package:acacia/presentation/resources/styles_manager.dart';
import 'package:acacia/presentation/widgets/app_svg.dart';
import 'package:acacia/presentation/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    required this.tittle,
    required this.iconPath,
    this.iconSize,
    this.fontSize,
    this.iconColor = ColorsManager.offWhite300,
    this.style,
  });

  final String tittle;
  final String iconPath;
  final Color iconColor;
  final double? iconSize;
  final double? fontSize;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppSvg(path: iconPath, color: iconColor, height: iconSize),
        const HorizontalSpace(5),
        FittedBox(
          child: Text(
            tittle,
            style: style ?? get500MediumStyle(fontSize: fontSize?.sp ?? 12.sp),
          ),
        ),
      ],
    );
  }
}
