import 'package:acacia/app/shared/helper_functions.dart';
import 'package:acacia/presentation/resources/color_manager.dart';
import 'package:acacia/presentation/resources/responsive_manager.dart';
import 'package:acacia/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'button_type_enum.dart';
import 'buttons_methods.dart';

/// [buttonWidthRatio] is present as a function from width
class AppButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? iconSize;
  final double? radius;
  final ButtonContentType buttonType;
  final String? svgIconPath;
  final Color? backgroundColor;
  final Color? fontColor;
  final Color? iconColor;
  final bool matchFontColor;
  final double? buttonWidthRatio;
  final BorderSide borderSide;
  final bool fitContent;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.fitContent = false,
    this.height,
    this.fontSize,
    this.buttonType = ButtonContentType.text,
    this.svgIconPath,
    this.backgroundColor,
    this.fontColor,
    this.iconSize,
    this.matchFontColor = false,
    this.radius,
    this.iconColor,
    this.buttonWidthRatio,
    this.borderSide = BorderSide.none,
  });

  factory AppButton.dark({
    required String text,
    required void Function() onPressed,
    double? width,
    double? height,
    double? fontSize,
    double? iconSize,
    ButtonContentType buttonType = ButtonContentType.text,
    String? svgIconPath,
    double? radius,
    bool matchFontColor = false,
  }) => AppButton(
    text: text,
    onPressed: onPressed,
    fontColor: AppColors.whiteTextColor,
    backgroundColor: AppColors.redPrimary,
    height: height,
    width: width,
    svgIconPath: svgIconPath,
    buttonType: buttonType,
    fontSize: fontSize,
    iconSize: iconSize,
    matchFontColor: matchFontColor,
    radius: radius,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fitContent ? null : AppSize.s1.sw * (buttonWidthRatio ?? 1),
      height: height,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            onPressed == null
                ? AppColors.redPrimary75
                : backgroundColor ?? Theme.of(context).colorScheme.onSurface,
          ),
          foregroundColor: WidgetStatePropertyAll(
            fontColor ?? Theme.of(context).colorScheme.surfaceContainerHighest,
          ),
          fixedSize: WidgetStatePropertyAll(
            Size(
              width ?? double.infinity,
              height ??
                  (isTablet(context) ? AppSize.s48.spMin : AppSize.s48.sp),
            ),
          ),
          maximumSize: WidgetStatePropertyAll(
            Size(
              ContextManager(context, hasAppBar: false).screenWidth,
              (isTablet(context) ? AppSize.s48.sp : AppSize.s48.sp),
            ),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              side: borderSide,
              borderRadius: BorderRadius.circular(radius ?? AppSize.s8.r),
            ),
          ),
        ),
        onPressed: onPressed,
        child: buildButtonChild(
          context: context,
          buttonType: buttonType,
          text: text,
          iconSize: iconSize,
          fontSize: fontSize,
          matchFontColor: matchFontColor,
          fontColor: fontColor ?? Theme.of(context).colorScheme.surface,
          iconColor: iconColor,
          svgIconPath: svgIconPath,
        ),
      ),
    );
  }
}
