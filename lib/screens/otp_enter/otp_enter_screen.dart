import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/constants/constants.dart';
import 'package:mechtronz/constants/tags.dart';
import 'package:mechtronz/global/controller/otp_controller.dart';
import 'package:mechtronz/modal/sign_in_request.dart';
import 'package:mechtronz/modal/sign_up_request.dart';
import 'package:mechtronz/screens/sign_in/controller/sign_in_controller.dart';
import 'package:mechtronz/utils/shadows.dart';
import 'package:mechtronz/utils/text_preset.dart';
import 'package:mechtronz/global/widgets/button.dart';
import 'package:mechtronz/global/widgets/custom_text_button.dart';
import 'package:mechtronz/global/widgets/header.dart';
import 'package:mechtronz/global/widgets/screen.dart';
import 'package:mechtronz/global/widgets/v_gap.dart';

class OtpEnterScreen extends StatefulWidget {
  final String phoneNumber;
  final SignUpRequest? signUpRequest;
  final SignInRequest? signInRequest;
  final bool? isCustomer;
  const OtpEnterScreen({
    super.key,
    required this.phoneNumber,
    this.signUpRequest,
    this.signInRequest,
    this.isCustomer,
  });

  @override
  State<OtpEnterScreen> createState() => _OtpEnterScreenState();
}

class _OtpEnterScreenState extends State<OtpEnterScreen> {
  String? countDown = '';
  bool isResend = false;
  bool isScrolable = false;
  final ScrollController _scrollController = ScrollController();
  late StreamSubscription<bool> keyboardSubscription;
  TextEditingController? otp1;
  TextEditingController? otp2;
  TextEditingController? otp3;
  TextEditingController? otp4;

  void onSubmit() {
    if (widget.signInRequest != null) {
      final signInRequest = widget.signInRequest;
      signInRequest!.otp =
          '${otp1?.text}${otp2?.text}${otp3?.text}${otp4?.text}';
      Get.find<SignInController>().signIn(signInRequest,
          isCustomer: widget.isCustomer ?? false, errorCallback: () {
        Get.back();
      });
    } else {
      Get.find<OtpController>().validateOtp(
        phoneNumber: widget.phoneNumber,
        otp: '${otp1?.text}${otp2?.text}${otp3?.text}${otp4?.text}',
        signUpRequest: widget.signUpRequest,
      );
    }
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void startTimer() {
    if (isResend) return;
    setState(() {
      isResend = true;
    });
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (timer.tick == 15) {
          timer.cancel();
          countDown = null;
          isResend = false;
        } else {
          final sec = (15 - timer.tick).toString();
          if (sec.length == 1) {
            countDown = '00:0$sec';
          } else {
            countDown = '00:$sec';
          }
        }
      });
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
    _scrollController.addListener(() {
      final position = _scrollController.position;
      if (position.atEdge) {
        if ((position.pixels == 0)) {
          setState(() {
            isScrolable = true;
          });
        } else {
          setState(() {
            isScrolable = false;
          });
        }
      } else {
        setState(() {
          isScrolable = true;
        });
      }
    });
    var keyboardVisibilityController = KeyboardVisibilityController();

    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (!visible) {
          if (_scrollController.position.pixels <= 0) {
            setState(() {
              isScrolable = false;
            });
          }
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    keyboardSubscription.cancel();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(
      init: OtpController(),
      builder: (controller) => Screen(
        footer: Column(
          children: [
            Container(
              height: 20.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: isScrolable ? kTopMediumShadow : null,
              ),
            ),
            Padding(
              padding: kHPadding,
              child: Hero(
                tag: Tags.submit,
                child: Button(
                  text: 'Verify',
                  disabled: (otp1?.text.isEmpty ?? true) ||
                      (otp2?.text.isEmpty ?? true) ||
                      (otp3?.text.isEmpty ?? true) ||
                      (otp4?.text.isEmpty ?? true),
                  onPressed: onSubmit,
                  loader: controller.otpLoader,
                ),
              ),
            ),
            VGap(gap: 20.h),
          ],
        ),
        child: ListView(
          controller: _scrollController,
          children: [
            const Header(),
            VGap(gap: 20.h),
            Text(
              'Enter verification code',
              style: kHeadline1,
            ),
            Text(
              'Enter the 4-digit code sent to you at ***${widget.phoneNumber.substring(6)}',
              style: kSubtitle3.copyWith(
                color: AppColors.gray400,
              ),
            ),
            VGap(gap: 20.h),
            Align(
              alignment: Alignment.centerLeft,
              child: OtpTextField(
                mainAxisAlignment: MainAxisAlignment.start,
                numberOfFields: 4,
                showFieldAsBox: true,
                enabledBorderColor: AppColors.gray100,
                borderRadius: BorderRadius.zero,
                showCursor: false,
                focusedBorderColor: Theme.of(context).primaryColor,
                borderWidth: 1,
                filled: true,
                fillColor: AppColors.gray100,
                handleControllers: (controllers) {
                  otp1 = controllers[0];
                  otp2 = controllers[1];
                  otp3 = controllers[2];
                  otp4 = controllers[3];
                },
                onSubmit: (String verificationCode) {
                  onSubmit();
                }, // end onSubmit
              ),
            ),
            VGap(gap: 20.h),
            CustomTextButton(
              linkText: countDown != null ? '' : 'RESEND CODE',
              preLinkText: 'Didn\'t receive the code? ',
              postLinkText: countDown,
              onTap: () {
                controller.genarateOtp(widget.phoneNumber,
                    isSignUp: widget.signUpRequest != null);
                startTimer();
              },
            ),
            VGap(gap: 20.h),
          ],
        ),
      ),
    );
  }
}
