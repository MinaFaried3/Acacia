import 'package:acacia/presentation/resources/color_manager.dart';
import 'package:acacia/presentation/resources/styles_manager.dart';
import 'package:acacia/presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final VoidCallback? onBackButtonPressed;
  final bool hasParentStack;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final Color? backgroundColor;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.centerTitle = false,
    this.onBackButtonPressed,
    this.systemOverlayStyle,
    this.backgroundColor = AppColors.whiteRedBgColor,
    this.hasParentStack = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      systemOverlayStyle:
          systemOverlayStyle ?? ThemeManger.whiteRedStatusBarStyle,
      surfaceTintColor: AppColors.white,
      actions: actions,
      leading: hasParentStack
          ? BackButton(
              color: AppColors.darkTextColor,
              onPressed: onBackButtonPressed ?? () => context.pop(),
            )
          : SizedBox(),
      title: Text(title, style: get500MediumStyle(fontSize: 18.sp)),
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarNoHeight extends StatelessWidget implements PreferredSizeWidget {
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool automaticallyImplyLeading;

  const AppBarNoHeight({
    super.key,
    this.systemOverlayStyle,
    this.automaticallyImplyLeading = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: systemOverlayStyle ?? ThemeManger.whiteStatusBarStyle,
      automaticallyImplyLeading: automaticallyImplyLeading,
      primary: false,
      toolbarHeight: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
