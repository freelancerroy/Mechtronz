import 'package:flutter/material.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/constants/constants.dart';
import 'package:mechtronz/utils/text_preset.dart';

class ThemeClass {
  static OutlineInputBorder _outlineInputBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: kBorderRadius,
      borderSide: BorderSide(
        color: color ?? AppColors.gray400,
      ),
    );
  }

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light().copyWith(primary: AppColors.primary),
    // - - - - -Light Theme Elevated Button Styles - - - - -
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(
          const Size(double.infinity, 55),
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.pressed)) {
            return AppColors.primary.withOpacity(0.5);
          } else if (states.contains(WidgetState.disabled)) {
            return AppColors.gray200;
          }
          return AppColors.primary;
        }),

        shape: WidgetStateProperty.resolveWith<OutlinedBorder>(
          (_) {
            return RoundedRectangleBorder(borderRadius: kBorderRadius);
          },
        ),

        overlayColor: WidgetStateProperty.resolveWith(
          (states) {
            return states.contains(WidgetState.pressed)
                ? AppColors.primary.withOpacity(0.25)
                : null;
          },
        ),

        textStyle: WidgetStateProperty.resolveWith(
          (states) =>
              const TextStyle(fontWeight: FontWeight.normal, fontSize: 23),
        ),
        foregroundColor:
            WidgetStateProperty.all<Color>(Colors.white), //actual text color
      ),
    ),
    // - - - - - - - - - - - - - - -  - - - - -

    // - - - - -Light Theme Input Styles - - - - -
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: kBody.copyWith(
        color: AppColors.gray400,
      ),
      border: _outlineInputBorder(),
      enabledBorder: _outlineInputBorder(),
      focusedBorder: _outlineInputBorder(color: AppColors.primary),
      errorBorder: _outlineInputBorder(color: AppColors.negative),
      errorStyle: kCaption.copyWith(
        color: AppColors.negative,
      ),
      errorMaxLines: 3,
      focusedErrorBorder: _outlineInputBorder(color: AppColors.negative),
      floatingLabelStyle: kCaption.copyWith(
        color: AppColors.primary,
      ),
    ),
    // - - - - - - - - - - - - - - -  - - - - -
  );
}
