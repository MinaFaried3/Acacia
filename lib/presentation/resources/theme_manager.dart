/*
* todo
* make general theme manger have sizing values or decoration shapes
* make light , dark theme manger
* copy with the different colors only
**/

import 'package:acacia/app/shared/common/constants.dart';
import 'package:acacia/presentation/resources/color_manager.dart';
import 'package:acacia/presentation/resources/styles_manager.dart';
import 'package:acacia/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'font_manager.dart';

class ThemeManger {
  static final ColorScheme colorScheme = ColorScheme(
    //primary main color for selected and elevated text and indicator
    primary: AppColors.sageGreen,
    //color of icons on primary color
    onPrimary: AppColors.cinnamonBrown,
    //color of backgrounds like avatar of flouting buttons
    primaryContainer: AppColors.caramelTan,
    // color of icon on onPrimary
    onPrimaryContainer: AppColors.offWhite300,
    brightness: Brightness.light,
    //color of background
    surface: AppColors.whiteTextColor,

    tertiary: AppColors.lightGreyBgSecondary,
    //back color for am or pm in time picker
    tertiaryContainer: AppColors.offWhite200,

    //color for am or pm in time picker
    onTertiaryContainer: AppColors.camelBeige,

    //outline color in date picker under the date and  dividers or decorative elements.
    outlineVariant: AppColors.lightGreyBgSecondary,

    //color of all borders and color of dot switch
    outline: AppColors.stoneBeige,

    //input validation errors InputDecoration.errorText.
    error: AppColors.error,

    //mix with surface color
    surfaceTint: null,

    //date title in date picker and icon button color ,and switching color of switch,and unselected checkbox
    onSurfaceVariant: AppColors.greyTextSecondary,
    //color of hour on time picker and back color of linear indicator, back ground of false switch
    surfaceContainerHighest: AppColors.orangeSecondary,
    //like snackBar for background
    inverseSurface: AppColors.darkWalnut,
    shadow: AppColors.lightOffWhite,

    //unused
    //appbar back ground you make
    inversePrimary: AppColors.lightGreyBgSecondary,
    //colors of borders on background
    onSurface: AppColors.darkFern[400]!,
    //secondary
    secondary: AppColors.goldenBeige,
    secondaryContainer: AppColors.goldenBeige[300],
    onSecondary: AppColors.caramelTan,
    onSecondaryContainer: AppColors.caramelTan[900],

    //error
    onError: AppColors.error[300]!,
    errorContainer: AppColors.error[400],
    onErrorContainer: AppColors.error[900],
    //surface
    onInverseSurface: AppColors.stoneBeige[400],
    //tertiary
    onTertiary: AppColors.lightGreyBgSecondary,
    //scrim
    // scrim: Colors.purple,
  );

  static const IconThemeData iconThemeData = IconThemeData(
    color: AppColors.darkTextColor,
  );

  static ActionIconThemeData actionIconThemeData = ActionIconThemeData(
    backButtonIconBuilder: (BuildContext context) => IconButton(
      icon: Icon(Icons.arrow_back_ios_new_rounded),
      onPressed: () => context.pop(),
      color: AppColors.darkTextColor,
    ),
  );

  static SystemUiOverlayStyle whiteStatusBarStyle = const SystemUiOverlayStyle(
    statusBarColor: AppColors.whiteBgColor, // iOS
    statusBarBrightness: Brightness.light, // iOS
    statusBarIconBrightness: Brightness.dark, //Android
    systemNavigationBarColor: AppColors.whiteBgColor, //Android
    systemNavigationBarIconBrightness: Brightness.dark, // Android
  );

  static SystemUiOverlayStyle whiteRedStatusBarStyle = SystemUiOverlayStyle(
    statusBarColor: AppColors.whiteRedBgColor,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: AppColors.whiteRedBgColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  static SystemUiOverlayStyle lightBlueStatusBarStyle = SystemUiOverlayStyle(
    statusBarColor: AppColors.lightBlueGreyBgColor,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: AppColors.lightBlueGreyBgColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  static SystemUiOverlayStyle getCustomStatusBar({
    required Color color,
    bool isStatusIconsLight = true,
  }) {
    Brightness brightness = isStatusIconsLight
        ? Brightness.dark
        : Brightness.light;

    return SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarBrightness: brightness,
      statusBarIconBrightness: brightness,
      systemNavigationBarColor: color,
      systemNavigationBarIconBrightness: brightness,
    );
  }

  static final AppBarTheme appBarTheme = AppBarTheme(
    systemOverlayStyle: whiteStatusBarStyle,
    iconTheme: iconThemeData,
    actionsIconTheme: iconThemeData,
    color: AppColors.whiteBgColor,
    elevation: AppSize.s0,
    // shadowColor: ColorManager.lightPrimary,
    titleTextStyle: get600SemiBoldStyle(fontSize: FontSize.s18.sp),
  );

  static const ButtonThemeData buttonThemeData = ButtonThemeData(
    shape: StadiumBorder(),
    disabledColor: AppColors.grey1,
    buttonColor: AppColors.paleVioletRed,
    splashColor: AppColors.beige1,
  );

  static final TextButtonThemeData textButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: const WidgetStatePropertyAll(AppColors.whiteBgColor),
      padding: const WidgetStatePropertyAll(EdgeInsets.all(AppPadding.p0)),
      textStyle: WidgetStatePropertyAll(
        get700BoldStyle(
          color: AppColors.whiteTextColor,
          fontSize: FontSize.s22.sp,
        ),
      ),
    ),
  );

  static final OutlinedButtonThemeData outlinedButtonThemeData =
      OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: const WidgetStatePropertyAll(AppColors.error),
          side: const WidgetStatePropertyAll(
            BorderSide(color: AppColors.whiteBgColor),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s14),
            ),
          ),
          textStyle: WidgetStatePropertyAll(
            get600SemiBoldStyle(fontSize: FontSize.s18.sp),
          ),
          padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        ),
      );

  static const IconButtonThemeData iconButtonThemeData = IconButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStatePropertyAll(EdgeInsets.all(AppPadding.p0)),
    ),
  );
  static final ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: get400RegularStyle(
            color: AppColors.whiteBgColor,
            fontSize: FontSize.s17,
          ),
          backgroundColor: AppColors.redPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
          ),
        ),
      );

  //todo
  static final TextTheme textTheme = TextTheme(
    //headlines
    headlineLarge: get800ExtraBoldStyle(
      color: AppColors.earthBrown,
      fontSize: FontSize.s28.sp,
    ),
    headlineMedium: get700BoldStyle(
      color: AppColors.earthBrown,
      fontSize: FontSize.s26.sp,
    ),
    headlineSmall: get600SemiBoldStyle(
      color: AppColors.earthBrown,
      fontSize: FontSize.s20.sp,
    ),

    //titles
    titleLarge: get600SemiBoldStyle(
      color: AppColors.earthBrown,
      fontSize: FontSize.s28.sp,
    ),
    titleMedium: get400RegularStyle(
      color: AppColors.earthBrown,
      fontSize: FontSize.s26.sp,
    ),
    titleSmall: get500MediumStyle(
      color: AppColors.earthBrown,
      fontSize: FontSize.s20.sp,
    ),

    //displays
    displayLarge: get400RegularStyle(
      color: AppColors.earthBrown,
      fontSize: FontSize.s28.sp,
    ),
    displayMedium: get500MediumStyle(
      color: AppColors.earthBrown,
      fontSize: FontSize.s26.sp,
    ),
    displaySmall: get300LightStyle(
      color: AppColors.earthBrown,
      fontSize: FontSize.s20.sp,
    ),

    //bodies
    bodyLarge: get400RegularStyle(
      color: AppColors.earthBrown,
      fontSize: FontSize.s22.sp,
    ),
    bodyMedium: get500MediumStyle(
      color: AppColors.earthBrown,
      fontSize: FontSize.s15.sp,
    ),
    bodySmall: get300LightStyle(
      color: AppColors.earthBrown,
      fontSize: FontSize.s14.sp,
    ),

    //labels
    labelLarge: get500MediumStyle(
      color: AppColors.earthBrown,
      fontSize: FontSize.s28.sp,
    ),
    labelMedium: get300LightStyle(
      color: AppColors.earthBrown,
      fontSize: FontSize.s26.sp,
    ),
    labelSmall: get200ExtraLightStyle(
      color: AppColors.earthBrown,
      fontSize: FontSize.s20.sp,
    ),
  );

  static const BottomSheetThemeData bottomSheetThemeData = BottomSheetThemeData(
    backgroundColor: AppColors.white,
  );

  static const TextSelectionThemeData textSelectionThemeData =
      TextSelectionThemeData(
        cursorColor: AppColors.redPrimary,
        selectionColor: AppColors.bluePrimary25,
        selectionHandleColor: AppColors.redPrimary,
      );

  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    isDense: true,
    // content padding
    contentPadding: const EdgeInsets.symmetric(
      vertical: AppSize.s14,
      horizontal: AppSize.s8,
    ),
    // hint style
    hintStyle: get400RegularStyle(
      color: AppColors.blackTextSecondary.withOpacity(AppSize.s0_75),
      fontSize: AppSize.s28.sp,
    ),
    //align label
    alignLabelWithHint: true,
    labelStyle: get400RegularStyle(
      color: AppColors.blackTextSecondary.withOpacity(AppSize.s0_75),
      fontSize: AppSize.s20.sp,
    ),
    errorStyle: get400RegularStyle(
      color: AppColors.red700,
      fontSize: AppSize.s14,
    ),
    errorMaxLines: AppConstants.one,

    //filled colors
    filled: true,
    fillColor: AppColors.lightBlueGreyBgColor,

    // enabled border style
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
    ),

    // focused border style
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.bluePrimary, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
    ),

    // error border style
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.red700, width: AppSize.s1),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
    ),

    // focused border style
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s20)),
    ),
  );
}

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: ThemeManger.colorScheme.brightness,
    // main colors
    colorScheme: ThemeManger.colorScheme,
    primaryColor: AppColors.redPrimary,
    primaryColorLight: AppColors.error,
    focusColor: AppColors.thistle,
    primaryColorDark: AppColors.mauva,
    disabledColor: AppColors.grey1,
    splashColor: AppColors.beige1,
    scaffoldBackgroundColor: AppColors.whiteBgColor,

    //todo
    badgeTheme: const BadgeThemeData(),
    datePickerTheme: const DatePickerThemeData(),
    timePickerTheme: const TimePickerThemeData(),
    listTileTheme: const ListTileThemeData(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
    dataTableTheme: const DataTableThemeData(),
    snackBarTheme: const SnackBarThemeData(),
    bannerTheme: const MaterialBannerThemeData(),
    // platform: TargetPlatform.android,

    // ripple effect color
    // cardView theme
    // cardTheme: ThemeManger.cardTheme,
    // app bar theme
    appBarTheme: ThemeManger.appBarTheme,
    // action icon theme
    actionIconTheme: ThemeManger.actionIconThemeData,
    // button theme
    buttonTheme: ThemeManger.buttonThemeData,
    //icon button theme
    iconButtonTheme: ThemeManger.iconButtonThemeData,
    // text button theme
    textButtonTheme: ThemeManger.textButtonThemeData,
    // outlined button theme
    outlinedButtonTheme: ThemeManger.outlinedButtonThemeData,
    // elevated button theme
    elevatedButtonTheme: ThemeManger.elevatedButtonThemeData,

    bottomSheetTheme: ThemeManger.bottomSheetThemeData,

    iconTheme: ThemeManger.iconThemeData,

    textTheme: ThemeManger.textTheme,
    //text selection
    textSelectionTheme: ThemeManger.textSelectionThemeData,

    // input decoration theme (text form field)
    inputDecorationTheme: ThemeManger.inputDecorationTheme,
    // label style
  );
}
