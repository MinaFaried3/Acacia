import 'package:acacia/app/shared/helper_functions.dart';
import 'package:acacia/presentation/resources/color_manager.dart';
import 'package:acacia/presentation/resources/styles_manager.dart';
import 'package:acacia/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final double? padding;
  final void Function()? onPressed;
  final double? fontSize;

  const AppTextButton({
    super.key,
    required this.text,
    this.padding,
    this.onPressed,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.all(padding ?? 8.0),
        child: Text(
          text,
          style: get500MediumStyle(
            color: AppColors.bluePrimary,
            fontSize:
                fontSize ??
                (isTablet(context) ? AppSize.s10.sp : AppSize.s14.spMin),
          ).copyWith(decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}
