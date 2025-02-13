import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechtronz/data/network/app_repository.dart';
import 'package:mechtronz/data/network/handle_error.dart';
import 'package:mechtronz/global/controller/init_controller.dart';
import 'package:mechtronz/global/controller/otp_controller.dart';
import 'package:mechtronz/global/widgets/error_dialog.dart';
import 'package:mechtronz/modal/sign_in_request.dart';
import 'package:mechtronz/screens/otp_enter/otp_enter_screen.dart';

class SignInController extends OtpController {
  var isLoading = false;

  Future<void> validateNumber(SignInRequest signInRequest,
      {required bool isCustomer}) async {
    final isSuccess = await genarateOtp(signInRequest.phoneNumber!);

    if (isSuccess) {
      Get.to(
        () => OtpEnterScreen(
          phoneNumber: signInRequest.phoneNumber!,
          signInRequest: signInRequest,
          isCustomer: isCustomer,
        ),
      );
    }
  }

  Future signIn(SignInRequest signInRequest,
      {required bool isCustomer, VoidCallback? errorCallback}) async {
    isLoading = true;
    update();
    try {
      final res = await AppRepository().signIn(signInRequest);
      if (res.success == true &&
          res.result != null &&
          res.result!.accessToken != null &&
          res.result!.userId != null) {
        Get.find<InitController>().signIn(
          token: res.result!.accessToken!,
          id: res.result!.userId!,
          isCustomer: isCustomer,
        );
      } else {
        final error = handleError(res.error);
        await errorDialog(error);
        errorCallback?.call();
      }
    } catch (e) {
      final error = handleError(e);
      await errorDialog(error);
      errorCallback?.call();
    } finally {
      isLoading = false;
      update();
    }
  }
}
