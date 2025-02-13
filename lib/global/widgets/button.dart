import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/utils/text_preset.dart';

class Button extends StatelessWidget {
  final String? text;
  final bool disabled;
  final Color? backgroundColor;
  final Color? textColor;
  final Function()? onPressed;
  final Widget? child;
  final bool loader;
  const Button({
    super.key,
    this.text,
    this.disabled = false,
    this.loader = false,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled
          ? null
          : loader
              ? () {}
              : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      child: loader
          ? Container(
              padding: EdgeInsets.all(6.h),
              height: 40.h,
              width: 40.h,
              child: CircularProgressIndicator(
                color: AppColors.white,
                strokeWidth: 2.5.h,
              ),
            )
          : child ??
              Text(
                text ?? '',
                style: kButton.copyWith(
                  color: disabled
                      ? AppColors.textSecondary
                      : textColor ?? AppColors.white,
                ),
              ),
    );
  }
}
