import 'package:acacia/app/shared/helper_functions.dart';
import 'package:acacia/presentation/resources/color_manager.dart';
import 'package:acacia/presentation/resources/values_manager.dart';
import 'package:acacia/presentation/widgets/app_elevation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CircleButton extends StatelessWidget {
  final IconData? icon;
  final double size;
  final VoidCallback onPressed;
  final bool showRedDot;
  final String? svgPath;

  const CircleButton({
    super.key,
    this.icon,
    required this.onPressed,
    this.size = 36,
    this.showRedDot = false,
    this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    double size = isTablet(context) ? this.size.sp / 1.4 : this.size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AppElevation(
          shape: CircleBorder(),
          color: AppColors.white,
          child: InkWell(
            onTap: onPressed,
            customBorder: CircleBorder(),
            child: Container(
              width: size,
              height: size,
              alignment: Alignment.center,
              child: svgPath != null
                  ? SvgPicture.asset(
                      svgPath!,
                      width: size * 0.65,
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        AppColors.darkTextColor,
                        BlendMode.srcIn,
                      ),
                    )
                  : Icon(
                      icon,
                      size: size * 0.65,
                      color: AppColors.darkTextColor,
                    ),
            ),
          ),
        ),
        if (showRedDot)
          Positioned(
            top: size / 5,
            right: size / 4.5,
            child: Container(
              width: AppSize.s10,
              height: AppSize.s10,
              decoration: BoxDecoration(
                color: AppColors.redPrimary,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }
}
