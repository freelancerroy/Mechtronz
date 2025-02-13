import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/constants/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechtronz/constants/tags.dart';
import 'package:mechtronz/modal/sign_in_request.dart';
import 'package:mechtronz/screens/forgot_password/forgot_password_screen.dart';
import 'package:mechtronz/screens/sign_in/controller/sign_in_controller.dart';
import 'package:mechtronz/screens/sign_up/sign_up_screen.dart';
import 'package:mechtronz/utils/helper.dart';
import 'package:mechtronz/utils/text_preset.dart';
import 'package:mechtronz/global/widgets/custom_text_button.dart';
import 'package:mechtronz/global/widgets/custom_text_field.dart';
import 'package:mechtronz/global/widgets/header.dart';
import 'package:mechtronz/global/widgets/screen.dart';
import 'package:mechtronz/global/widgets/v_gap.dart';
import 'package:mechtronz/utils/validator.dart';

import '../../global/widgets/button.dart';

class SignInScreen extends StatefulWidget {
  final bool isCustomer;
  const SignInScreen({super.key, required this.isCustomer});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isOtpSignIn = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void onSubmit() {
    if (_formKey.currentState?.validate() == true) {
      if (isOtpSignIn) {
        Get.find<SignInController>().validateNumber(
          SignInRequest(
            phoneNumber: _phoneController.text,
            rememberClient: true,
          ),
          isCustomer: widget.isCustomer,
        );
      } else {
        Get.find<SignInController>().signIn(
          SignInRequest(
            userNameOrEmailAddress: _emailController.text,
            password: _passwordController.text,
            rememberClient: true,
          ),
          isCustomer: widget.isCustomer,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
        init: SignInController(),
        builder: (controller) {
          return Screen(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Header(),
                    const VGap(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // const VGap(),
                        Text(
                          'Sign In',
                          style: kHeadline1,
                          // textAlign: TextAlign.left,
                        ),
                        Hero(
                          tag: Tags.logo,
                          child: Image.asset(
                            AssetsImage.logo,
                            height: 50.w,
                            width: 50.w,
                          ),
                        ),
                      ],
                    ),
                    const VGap(),
                    if (isOtpSignIn)
                      CustomTextField(
                        label: 'Phone Number',
                        keyboardType: TextInputType.phone,
                        validator: Validator.isValidPhoneNumber,
                        controller: _phoneController,
                      ),
                    if (!isOtpSignIn) ...[
                      CustomTextField(
                        label: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: Validator.isValidEmail,
                        controller: _emailController,
                      ),
                      const VGap(),
                      CustomTextField(
                        label: 'Password',
                        obscureText: true,
                        validator: Validator.isValidPassword,
                        controller: _passwordController,
                      ),
                      VGap(gap: 5.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomTextButton(
                          linkText: 'Forgot Password?',
                          onTap: () => Helper.navigate(
                              context, const ForgotPasswordScreen()),
                        ),
                      ),
                    ],
                    VGap(gap: 50.h),
                    Hero(
                      tag: Tags.submit,
                      child: Button(
                        text: isOtpSignIn ? 'Request OTP' : 'Sign In',
                        // disabled: true,
                        onPressed: onSubmit,
                        loader: controller.isLoading || controller.otpLoader,
                      ),
                    ),
                    VGap(),
                    Align(
                      alignment: Alignment.center,
                      child: CustomTextButton(
                        preLinkText: 'Or ',
                        linkText: isOtpSignIn
                            ? 'Sign in with Password'
                            : 'Sign in with OTP',
                        onTap: () {
                          setState(() {
                            isOtpSignIn = !isOtpSignIn;
                            _emailController.clear();
                            _passwordController.clear();
                            _phoneController.clear();
                          });
                        },
                        linkColor: AppColors.primary,
                        textColor: AppColors.textSecondary,
                      ),
                    ),
                    if (widget.isCustomer) ...[
                      VGap(gap: 100.h),
                      const Divider(color: AppColors.gray200),
                      VGap(gap: 20.h),
                      Align(
                        alignment: Alignment.center,
                        child: CustomTextButton(
                          linkText: 'Sign Up',
                          onTap: () {
                            Helper.navigate(
                              context,
                              const SignUpScreen(),
                            );
                          },
                          textColor: AppColors.textSecondary,
                          preLinkText: "Don't have an account? ",
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          );
        });
  }
}
