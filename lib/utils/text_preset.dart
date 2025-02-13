import 'package:flutter/material.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontSize {
  static double tiny = 10.sp;
  static double small = 12.sp;
  static double medium = 14.sp;
  static double mediumBig = 16.sp;
  static double big = 18.sp;
  static double large = 20.sp;
  static double huge = 24.sp;
  static double massive = 30.sp;
  static double hero = 32.sp;
}

TextStyle kBody = TextStyle(
  fontSize: FontSize.medium,
  height: 1.4,
  color: AppColors.textPrimary,
);

TextStyle kBodyBig = kBody.copyWith(
  fontSize: FontSize.mediumBig,
  height: 1.5,
);

TextStyle kCalendar = kBody.copyWith(
  fontSize: FontSize.large,
  height: 1.5,
);

TextStyle kHero = kBody.copyWith(
  fontSize: FontSize.hero,
  fontWeight: FontWeight.bold,
  height: 1.5,
);

TextStyle kHeadline1 = kBody.copyWith(
  fontSize: FontSize.huge,
  fontWeight: FontWeight.bold,
  height: 1.6,
);

TextStyle kHeadline2 = kBody.copyWith(
  fontSize: FontSize.large,
  fontWeight: FontWeight.bold,
  height: 1.6,
);

TextStyle kHeadline3 = kBody.copyWith(
  fontSize: FontSize.big,
  fontWeight: FontWeight.bold,
  height: 1.6,
);

TextStyle kHeadline5 = kBody.copyWith(
  fontSize: FontSize.large,
  fontWeight: FontWeight.bold,
  letterSpacing: FontSize.large * 0.1,
  height: 1.6,
);

TextStyle kHeadline6 = kBody.copyWith(
  fontSize: FontSize.big,
  fontWeight: FontWeight.bold,
  height: 1.6,
);

TextStyle kSubtitle1 = kBody.copyWith(
  fontSize: FontSize.big,
  fontWeight: FontWeight.w500,
  height: 1.5,
);

TextStyle kSubtitle2 = kBody.copyWith(
  fontSize: FontSize.medium,
  fontWeight: FontWeight.w500,
);

TextStyle kSubtitle3 = kBody.copyWith(
  fontSize: FontSize.medium,
  height: 1.4,
);

TextStyle kCaption = kBody.copyWith(
  fontSize: FontSize.small,
  height: 1.4,
);

TextStyle kCaptionUppercase = kBody.copyWith(
  fontSize: FontSize.small,
  letterSpacing: FontSize.small * 0.2,
  height: 1.2,
  textBaseline: TextBaseline.alphabetic,
);

TextStyle kButton = kBody.copyWith(
    fontSize: FontSize.large,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: AppColors.white);

TextStyle kLink = kBody.copyWith(
  fontSize: FontSize.medium,
  fontWeight: FontWeight.w500,
  // letterSpacing: FontSize.medium * 0.1,
  // height: 1.4,
  decoration: TextDecoration.underline,
);

TextStyle kTabBar = kBody.copyWith(
  fontSize: FontSize.tiny,
  letterSpacing: FontSize.tiny * 0.1,
  height: 1.2,
);
