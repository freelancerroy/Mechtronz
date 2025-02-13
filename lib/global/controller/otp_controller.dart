import 'package:get/get.dart';
import 'package:mechtronz/data/network/app_repository.dart';
import 'package:mechtronz/data/network/handle_error.dart';
import 'package:mechtronz/global/widgets/error_dialog.dart';
import 'package:mechtronz/modal/genarate_otp_request.dart';
import 'package:mechtronz/modal/sign_up_request.dart';
import 'package:mechtronz/modal/validate_otp_request.dart';
import 'package:mechtronz/screens/sign_up/controller/sign_up_controller.dart';

class OtpController extends GetxController {
  var otpLoader = false;

  Future<bool> genarateOtp(String phoneNumber, {bool isSignUp = false}) async {
    otpLoader = true;
    update();
    try {
      final response = await AppRepository().genarateOtp(
          GenarateOtpRequest(phoneNumber: phoneNumber, isSingUp: isSignUp));
      if (response.result?.success == false) {
        errorDialog(response.result?.message ?? '');
      }
      return response.result?.success ?? false;
    } catch (e) {
      final error = handleError(e);
      errorDialog(error);
      return false;
    } finally {
      otpLoader = false;
      update();
    }
  }

  void validateOtp({
    required String phoneNumber,
    required String otp,
    SignUpRequest? signUpRequest,
  }) async {
    otpLoader = true;
    update();
    try {
      final response = await AppRepository().validateOtp(ValidateOtpRequest(
        phoneNumber: phoneNumber,
        otp: otp,
      ));

      if (response.result?.success == false) {
        errorDialog(response.result?.message ?? '');
      } else {
        if (signUpRequest != null) {
          await Get.find<SignUpController>().signUp(signUpRequest);
        }
      }
    } catch (e) {
      final error = handleError(e);
      errorDialog(error);
    } finally {
      otpLoader = false;
      update();
    }
  }
}
