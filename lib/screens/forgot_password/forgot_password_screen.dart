import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/constants/tags.dart';
import 'package:mechtronz/utils/text_preset.dart';
import 'package:mechtronz/global/widgets/button.dart';
import 'package:mechtronz/global/widgets/custom_text_button.dart';
import 'package:mechtronz/global/widgets/custom_text_field.dart';
import 'package:mechtronz/global/widgets/header.dart';
import 'package:mechtronz/global/widgets/screen.dart';
import 'package:mechtronz/global/widgets/v_gap.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Screen(
        child: Column(
      children: [
        const Header(
          title: 'Forgot Password',
        ),
        const VGap(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                'Enter your register mobile number',
                style: kHeadline1,
              ),
            ),
          ],
        ),
        const VGap(),
        const CustomTextField(label: 'Mobile Number'),
        VGap(gap: 40.h),
        Hero(
          tag: Tags.submit,
          child: Button(
            onPressed: () {
              // Helper.navigate(context, const OtpEnterScreen());
            },
            text: 'Next',
          ),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.center,
          child: CustomTextButton(
            linkText: 'Sign In',
            onTap: () {
              Navigator.pop(context);
            },
            textColor: AppColors.textSecondary,
            preLinkText: "Already have an account? ",
          ),
        ),
        VGap(gap: 40.h),
      ],
    ));
  }
}
