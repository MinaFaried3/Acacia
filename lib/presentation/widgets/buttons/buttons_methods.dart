import 'package:acacia/app/shared/helper_functions.dart';
import 'package:acacia/presentation/resources/color_manager.dart';
import 'package:acacia/presentation/resources/styles_manager.dart';
import 'package:acacia/presentation/resources/values_manager.dart';
import 'package:acacia/presentation/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'button_type_enum.dart';

Widget buildButtonChild({
  required BuildContext context,
  required ButtonContentType buttonType,
  String? svgIconPath,
  required Color fontColor,
  Color? iconColor,
  required String text,
  double? fontSize,
  double? iconSize,
  bool matchFontColor = false,
}) {
  switch (buttonType) {
    case ButtonContentType.text:
      return buildText(context, text, buttonType, fontColor, fontSize);
    case ButtonContentType.bold:
      return buildText(context, text, buttonType, fontColor, fontSize);
    case ButtonContentType.icon:
      return buildIcon(
        context,
        svgIconPath,
        fontColor,
        iconColor,
        iconSize,
        matchFontColor,
      );
    case ButtonContentType.iconText:
      return FittedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildIcon(
                context,
                svgIconPath,
                fontColor,
                iconColor,
                iconSize,
                matchFontColor,
              ),
              HorizontalSpace(AppSize.s12.w),
              buildText(context, text, buttonType, fontColor, fontSize),
            ],
          ),
        ),
      );
  }
}

Widget buildIcon(
  BuildContext context,
  String? svgIconPath,
  Color fontColor,
  Color? iconColor,
  double? iconSize,
  bool matchFontColor,
) => svgIconPath != null
    ? SvgPicture.asset(
        svgIconPath,
        height: iconSize ?? AppSize.s24.sp,
        matchTextDirection: true,
        colorFilter: ColorFilter.mode(
          iconColor ?? (matchFontColor ? fontColor : AppColors.redPrimaryAA),
          BlendMode.srcIn,
        ),
      )
    : const SizedBox.shrink();

Widget buildText(
  BuildContext context,
  String text,
  ButtonContentType buttonType,
  Color fontColor,
  double? fontSize,
) {
  return FittedBox(
    child: Text(
      text,
      style: buildStyle(context, buttonType, fontColor, fontSize?.sp),
      textAlign: TextAlign.center,
      softWrap: false,
      maxLines: 1,
      overflow: TextOverflow.fade,
    ),
  );
}

TextStyle buildStyle(
  BuildContext context,
  ButtonContentType buttonType,
  Color fontColor,
  double? fontSize,
) {
  double responsiveFontSize = (isTablet(context)
      ? AppSize.s12.sp
      : AppSize.s16.spMin);
  switch (buttonType) {
    case ButtonContentType.text:
      return get500MediumStyle(
        color: fontColor,
        fontSize: fontSize ?? responsiveFontSize,
      );
    case ButtonContentType.icon:
      return get500MediumStyle(
        color: fontColor,
        fontSize: fontSize ?? responsiveFontSize,
      );
    case ButtonContentType.iconText:
      return get500MediumStyle(
        color: fontColor,
        fontSize: fontSize ?? responsiveFontSize,
      );
    case ButtonContentType.bold:
      return get700BoldStyle(
        color: fontColor,
        fontSize: fontSize ?? responsiveFontSize,
      );
  }
}
