import 'package:acacia/app/shared/extensions/empty_or_null.dart';
import 'package:acacia/app/shared/helper_functions.dart';
import 'package:acacia/presentation/resources/color_manager.dart';
import 'package:acacia/presentation/resources/font_manager.dart';
import 'package:acacia/presentation/resources/styles_manager.dart';
import 'package:acacia/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.onChanged,
    this.focusNode,
    this.textDirection,
    this.textInputType,
    this.onTap,
    this.onFieldSubmitted,
    this.hintText,
    this.prefix,
    this.suffix,
    this.outSideIcon,
    this.svgPrefixPath,
    this.labelText,
    this.textInputAction,
    this.autofillHints,
    this.textCapitalization,
    this.inputFormatters,
    this.onSaved,
    this.textAlign,
    this.floatingLabelAlignment,
    this.errorMessage,
    this.readOnly = false,
    this.border,
    this.prefixIconConstrains = const BoxConstraints(
      maxWidth: AppSize.s56,
      maxHeight: AppSize.s56,
      minWidth: AppSize.s32,
      minHeight: AppSize.s32,
    ),
    this.fillColor = AppColors.lightGreyBgSecondary,
  });

  final bool isPassword;
  final bool readOnly;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final TextDirection? textDirection;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? labelText;
  final String? svgPrefixPath;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? outSideIcon;
  final Iterable<String>? autofillHints;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final FloatingLabelAlignment? floatingLabelAlignment;
  final String? errorMessage;
  final OutlineInputBorder? border;
  final BoxConstraints prefixIconConstrains;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return textDirection == null
        ? _buildTextFormField(context)
        : Directionality(
            textDirection: textDirection!,
            child: _buildTextFormField(context),
          );
  }

  Widget _buildTextFormField(context) {
    var borderRadius = BorderRadius.circular(AppSize.s12.r);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.s8.w,
              vertical: AppSize.s4.h,
            ),
            child: FittedBox(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                labelText!,
                textAlign: TextAlign.start,
                style: get400RegularStyle(
                  color: AppColors.blackTextLightSecondary
                    ..withValues(alpha: AppSize.s0_75),
                  fontSize: isTablet(context)
                      ? AppSize.s12.sp
                      : FontSize.s16.spMin,
                ),
              ),
            ),
          ),
        TextFormField(
          obscureText: isPassword,
          controller: controller,
          keyboardType: textInputType,
          textInputAction: TextInputAction.next,
          onTap: onTap,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          obscuringCharacter: '●',
          autofillHints: autofillHints,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          inputFormatters: inputFormatters,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLength: _getFieldLength(),
          cursorOpacityAnimates: true,
          textAlign: textAlign ?? TextAlign.start,
          readOnly: readOnly,
          cursorWidth: AppSize.s1,
          style: get400RegularStyle(
            color: AppColors.blackTextSecondary,
            fontSize: AppSize.s16.spMin,
          ),
          textAlignVertical: TextAlignVertical.center,
          // For centering input vertically
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: AppPadding.p14.h,
              horizontal: AppPadding.p8.w,
            ),
            counterStyle: get500MediumStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: isTablet(context) ? AppSize.s8.sp : FontSize.s10.spMin,
            ),
            prefixIcon: svgPrefixPath != null
                ? Padding(
                    padding: EdgeInsets.all(AppPadding.p6.sp),
                    child: SvgPicture.asset(
                      svgPrefixPath!,
                      matchTextDirection: true,
                      width: AppSize.s10,
                      height: AppSize.s10,
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        AppColors.offWhite..withValues(alpha: AppSize.s0_75),
                        BlendMode.srcIn,
                      ),
                    ),
                  )
                : null,
            prefixIconConstraints: prefixIconConstrains,
            prefix: svgPrefixPath == null ? prefix : null,
            suffixIcon:
                controller.isNotNull && controller?.text.isNotEmpty == true
                ? suffix
                : null,
            alignLabelWithHint: true,
            icon: outSideIcon,
            filled: true,
            fillColor: fillColor,
            hintText: hintText,
            hintStyle: get400RegularStyle(
              color: AppColors.offWhite500.withValues(alpha: AppSize.s0_75),
              fontSize: isTablet(context) ? AppSize.s10.sp : AppSize.s12.spMin,
            ),
            border:
                border ??
                OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide.none,
                ),
            floatingLabelAlignment:
                floatingLabelAlignment ?? FloatingLabelAlignment.start,
            errorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide.none,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(
                color: AppColors.errorColor,
                width: AppSize.s2.sp,
              ),
            ),
            enabledBorder:
                border ??
                OutlineInputBorder(
                  borderRadius: borderRadius,
                  borderSide: BorderSide.none,
                ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(
                color: AppColors.bluePrimary,
                width: AppSize.s2.sp,
              ),
            ),
          ),
          cursorColor: AppColors.redPrimary,
          focusNode: focusNode,

          validator: errorMessage == null ? validator : null,
          onChanged: onChanged,
        ),
        if (errorMessage != null) ...[
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              "$errorMessage",
              textAlign: TextAlign.start,
              style: TextStyle(color: AppColors.errorColor),
            ),
          ),
        ],
      ],
    );
  }

  int? _getFieldLength() {
    return null;

    // if (textInputType != TextInputType.phone) {
    //   return null;
    // }
    //
    // return AppConstants.phoneNumberLength;
  }
}
