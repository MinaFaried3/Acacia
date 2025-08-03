import 'package:acacia/presentation/resources/color_manager.dart';
import 'package:acacia/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontConstants.arabicFontFamily,
    color: color,
    fontWeight: fontWeight,
  );
}

// extra style
TextStyle get200ExtraLightStyle({
  double fontSize = FontSize.s10,
  Color color = ColorsManager.darkTextColor,
}) {
  return _getTextStyle(fontSize, FontWeightManager.extraLight, color);
}

// light style
TextStyle get300LightStyle({
  double fontSize = FontSize.s12,
  Color color = ColorsManager.darkTextColor,
}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// regular style
TextStyle get400RegularStyle({
  double fontSize = FontSize.s14,
  Color color = ColorsManager.darkTextColor,
}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// medium style
TextStyle get500MediumStyle({
  double? fontSize = FontSize.s16,
  Color color = ColorsManager.darkTextColor,
}) {
  return _getTextStyle(
    fontSize ?? FontSize.s16,
    FontWeightManager.medium,
    color,
  );
}

// semiBold style
TextStyle get600SemiBoldStyle({
  double fontSize = FontSize.s16,
  Color color = ColorsManager.darkTextColor,
}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

// bold style
TextStyle get700BoldStyle({
  double? fontSize = FontSize.s16,
  Color color = ColorsManager.darkTextColor,
}) {
  return _getTextStyle(fontSize ?? FontSize.s16, FontWeightManager.bold, color);
}

// extra bold style
TextStyle get800ExtraBoldStyle({
  double fontSize = FontSize.s16,
  Color color = ColorsManager.darkTextColor,
}) {
  return _getTextStyle(fontSize, FontWeightManager.extraBold, color);
}

// black style
TextStyle get900BlackStyle({
  double fontSize = FontSize.s16,
  Color color = ColorsManager.darkTextColor,
}) {
  return _getTextStyle(fontSize, FontWeightManager.black, color);
}

TextStyle getHeading1Style({
  double fontSize = FontSize.s24,
  Color color = ColorsManager.darkTextColor,
}) => _getTextStyle(fontSize, FontWeightManager.bold, color);

TextStyle getHeading1GreyStyle({
  double fontSize = FontSize.s24,
  Color color = ColorsManager.greyTextColor,
}) => _getTextStyle(fontSize, FontWeightManager.bold, color);

TextStyle getHeading2Style({
  double fontSize = FontSize.s20,
  Color color = ColorsManager.darkTextColor,
}) => _getTextStyle(fontSize, FontWeightManager.bold, color);

TextStyle getHeading3Style({
  double fontSize = FontSize.s16,
  Color color = ColorsManager.darkTextColor,
}) => _getTextStyle(fontSize, FontWeightManager.bold, color);

TextStyle getText1Style({
  double fontSize = FontSize.s16,
  Color color = ColorsManager.greyTextColor,
}) => _getTextStyle(fontSize, FontWeightManager.medium, color);

TextStyle getNumberStyle({
  double fontSize = FontSize.s24,
  Color color = ColorsManager.bluePrimary,
}) => _getTextStyle(fontSize, FontWeightManager.bold, color);

TextStyle getText2Style({
  double fontSize = FontSize.s14,
  Color color = ColorsManager.darkTextColor,
}) => _getTextStyle(fontSize, FontWeightManager.bold, color);

TextStyle getText3Style({
  double fontSize = FontSize.s14,
  Color color = ColorsManager.greyTextColor,
}) => _getTextStyle(fontSize, FontWeightManager.bold, color);

TextStyle getText4Style({
  double fontSize = FontSize.s14,
  Color color = ColorsManager.greyTextColor,
}) => _getTextStyle(fontSize, FontWeightManager.medium, color);

TextStyle getText5Style({
  double fontSize = FontSize.s12,
  Color color = ColorsManager.greyTextColor,
}) => _getTextStyle(fontSize, FontWeightManager.medium, color);

TextStyle getNavigationTextStyle({
  double fontSize = FontSize.s10,
  Color color = ColorsManager.greyTextColor,
}) => _getTextStyle(fontSize, FontWeightManager.medium, color);
