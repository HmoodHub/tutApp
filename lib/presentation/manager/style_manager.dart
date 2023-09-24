import 'package:flutter/material.dart';
import 'package:test_app_mvvm/presentation/manager/font_manager.dart';

TextStyle _getStyleText({
  String fontFamily = AppFontConstants.fontFamily,
  required FontWeight fontWeight,
  required Color color,
  required double size,
}) {
  return TextStyle(
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    color: color,
    fontSize: size,
  );
}

// light style
TextStyle getLightStyle(
    {required Color color, double size = AppFontSizeManager.s12}) {
  return _getStyleText(
    fontWeight: AppFontWeightManager.light,
    color: color,
    size: size,
  );
}

// regular style
TextStyle getRegularStyle(
    {required Color color, double size = AppFontSizeManager.s12}) {
  return _getStyleText(
    fontWeight: AppFontWeightManager.regular,
    color: color,
    size: size,
  );
}

// medium style
TextStyle getMediumStyle(
    {required Color color, double size = AppFontSizeManager.s14}) {
  return _getStyleText(
    fontWeight: AppFontWeightManager.medium,
    color: color,
    size: size,
  );
}

// bold style
TextStyle getBoldStyle(
    {required Color color, double size = AppFontSizeManager.s18}) {
  return _getStyleText(
    fontWeight: AppFontWeightManager.bold,
    color: color,
    size: size,
  );
}

// semiBold style
TextStyle getSemiBoldStyle(
    {required Color color, double size = AppFontSizeManager.s22}) {
  return _getStyleText(
    fontWeight: AppFontWeightManager.semiBold,
    color: color,
    size: size,
  );
}
