import 'package:flutter/material.dart';
import 'package:test_app_mvvm/presentation/manager/color_manager.dart';
import 'package:test_app_mvvm/presentation/manager/font_manager.dart';
import 'package:test_app_mvvm/presentation/manager/style_manager.dart';
import 'package:test_app_mvvm/presentation/manager/values_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
    // main colors
    primaryColor: AppColorManager.primary,
    primaryColorDark: AppColorManager.darkPrimary,
    primaryColorLight: AppColorManager.lightPrimary,
    disabledColor: AppColorManager.gray1,
    splashColor: AppColorManager.lightPrimary,
    // card view theme
    cardTheme: const CardTheme(
      color: AppColorManager.white,
      shadowColor: AppColorManager.gray,
      elevation: AppSize.s4,
    ),
    // app bar theme
    appBarTheme: AppBarTheme(
      color: AppColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: AppColorManager.lightPrimary,
      centerTitle: true,
      titleTextStyle: getRegularStyle(
        color: AppColorManager.white,
        size: AppSize.s16,
      ),
    ),
    // button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: AppColorManager.gray,
      splashColor: AppColorManager.lightPrimary,
      buttonColor: AppColorManager.primary,
    ),
    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSize.s12,
          ),
        ),
        backgroundColor: AppColorManager.primary,
        foregroundColor: AppColorManager.white,
        minimumSize: const Size(double.infinity, AppSize.s40),
        textStyle: getRegularStyle(
          color: AppColorManager.white,
          size: AppSize.s18,
        ),
      ),
    ),
    // text theme
    textTheme: TextTheme(
      displayLarge: getLightStyle(
        color: AppColorManager.white,
        size: AppFontSizeManager.s22,
      ),
      headlineLarge: getSemiBoldStyle(
        color: AppColorManager.darkGray,
        size: AppFontSizeManager.s16,
      ),
      titleMedium: getMediumStyle(
        color: AppColorManager.lightGray,
        size: AppFontSizeManager.s14,
      ),
      bodySmall: getRegularStyle(
        color: AppColorManager.gray1,
      ),
      bodyLarge: getRegularStyle(
        color: AppColorManager.gray,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(
        AppPadding.p8,
      ),
      hintStyle: getRegularStyle(
        color: AppColorManager.gray,
        size: AppFontSizeManager.s14,
      ),
      labelStyle: getRegularStyle(
        color: AppColorManager.gray,
        size: AppFontSizeManager.s14,
      ),
      errorStyle: getRegularStyle(
        color: AppColorManager.error,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColorManager.gray,
        ),
        borderRadius: BorderRadius.circular(
          AppSize.s8,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColorManager.primary,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(
          AppSize.s8,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColorManager.error,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(
          AppSize.s8,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColorManager.error,
          width: AppSize.s1_5,
        ),
        borderRadius: BorderRadius.circular(
          AppSize.s8,
        ),
      ),
    ),
  );
}
