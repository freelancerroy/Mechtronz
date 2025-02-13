import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00000000);

  // // Primary Shades
  // static const int _primaryValue = 0xFFFF7506;
  // static const Color _primary50 = Color(0xFFFFF0D1);
  // static const Color _primary100 = Color(0xFFF79063);
  // static const Color _primary200 = Color(0xFFFAA84F);
  // static const Color _primary300 = Color(0xFFFB6F1E);
  // static const Color _primary400 = Color(0xFFFB5A00);
  // static const Color _primary500 = Color(_primaryValue);
  // static const Color _primary600 = Color(0xFFE94F03);
  // static const Color _primary700 = Color(0xFFD43F01);
  // static const Color _primary800 = Color(0xFFE24402);
  // static const Color _primary900 = Color(0xFFB73F02);

  // // Primary Shades
  // static const int _primaryValue = 0xFF273c6b;
  // static const Color _primary50 = Color(0xFFD0D8E8);
  // static const Color _primary100 = Color(0xFFA1B1D1);
  // static const Color _primary200 = Color(0xFF7189BA);
  // static const Color _primary300 = Color(0xFF4261A3);
  // static const Color _primary400 = Color(0xFF1B3F8F);
  // static const Color _primary500 = Color(_primaryValue);
  // static const Color _primary600 = Color(0xFF002A7B);
  // static const Color _primary700 = Color(0xFF002571);
  // static const Color _primary800 = Color(0xFF001F66);
  // static const Color _primary900 = Color(0xFF00195B);
  // // static const Color _primary900 = Color(_primaryValue);

  // Primary Shades
  static const int _primaryValue = 0xFF273c6b;
  static const Color _primary50 = Color(0xFFD4D8E1);
  static const Color _primary100 = Color(0xFFBEC5D3);
  static const Color _primary200 = Color(0xFFA9B1C4);
  static const Color _primary300 = Color(0xFF939EB5);
  static const Color _primary400 = Color(0xFF7D8AA6);
  static const Color _primary500 = Color(0xFF687797);
  static const Color _primary600 = Color(0xFF526389);
  static const Color _primary700 = Color(0xFF3D507A);
  static const Color _primary800 = Color(_primaryValue);
  static const Color _primary900 = Color(0xFF1D2D50);

  // // Secondary Shades
  // static const int _secondaryValue = 0xFF273c6b;
  // static const Color _secondary50 = Color(0xFFD0D8E8);
  // static const Color _secondary100 = Color(0xFFA1B1D1);
  // static const Color _secondary200 = Color(0xFF7189BA);
  // static const Color _secondary300 = Color(0xFF4261A3);
  // static const Color _secondary400 = Color(0xFF1B3F8F);
  // static const Color _secondary500 = Color(0xFF002A7B);
  // static const Color _secondary600 = Color(0xFF002571);
  // static const Color _secondary700 = Color(0xFF001F66);
  // static const Color _secondary800 = Color(0xFF00195B);
  // static const Color _secondary900 = Color(_secondaryValue);

  // Secondary Shades
  static const int _secondaryValue = 0xFF9595B5;
  static const Color _secondary50 = Color(0xFFEDEDF3);
  static const Color _secondary100 = Color(0xFFDCDCE6);
  static const Color _secondary200 = Color(0xFFCACADA);
  static const Color _secondary300 = Color(0xFFB9B8CE);
  static const Color _secondary400 = Color(0xFFA7A7C2);
  static const Color _secondary500 = Color(_secondaryValue);
  static const Color _secondary600 = Color(0xFF8483A9);
  static const Color _secondary700 = Color(0xFF72719D);
  static const Color _secondary800 = Color(0xFF616090);
  static const Color _secondary900 = Color(0xFF4B4A7D);

  static const MaterialColor primary = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: _primary50,
      100: _primary100,
      200: _primary200,
      300: _primary300,
      400: _primary400,
      500: _primary500,
      600: _primary600,
      700: _primary700,
      800: _primary800,
      900: _primary900,
    },
  );

  static const MaterialColor secondary = MaterialColor(
    _secondaryValue,
    <int, Color>{
      50: _secondary50,
      100: _secondary100,
      200: _secondary200,
      300: _secondary300,
      400: _secondary400,
      500: _secondary500,
      600: _secondary600,
      700: _secondary700,
      800: _secondary800,
      900: _secondary900,
    },
  );

  // Gray Shades
  static const Color gray50 = Color(0xFFFAFAFA);
  static const Color gray100 = Color(0xFFF4F4F4);
  static const Color gray200 = Color(0xFFE0E0E0);
  static const Color gray300 = Color(0xFFBDBDBD);
  static const Color gray400 = Color(0xFF9E9E9E);
  static const Color gray500 = Color(0xFF757575);
  static const Color gray600 = Color(0xFF616161);
  static const Color gray700 = Color(0xFF424242);
  static const Color gray800 = Color(0xFF212121);

  // Text Colors
  static const Color textPrimary = black;
  static const Color textSecondary = gray600;

  // Nagative Shades
  static const Color negative = Color(0xFFed0a0a);
  static const Color negative50 = Color(0xFFFDE7E7);

  // Positive Shades
  static const Color positive = Color(0xFF0aed0a);
  static const Color positive50 = Color(0xFFE7FDE7);

  // Warning Shades
  static const Color warning = Color(0xFFedc20a);
  static const Color warning50 = Color(0xFFFDF7E7);

  // Info Shades
  static const Color info = Color(0xFF21B7CA);
  static const Color info50 = Color(0xFFE7F2FD);
}
