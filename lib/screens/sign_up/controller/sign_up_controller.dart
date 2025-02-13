import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mechtronz/data/network/app_repository.dart';
import 'package:mechtronz/data/network/handle_error.dart';
import 'package:mechtronz/global/controller/otp_controller.dart';
import 'package:mechtronz/global/widgets/error_dialog.dart';
import 'package:mechtronz/modal/sign_up_request.dart';
import 'package:mechtronz/screens/otp_enter/otp_enter_screen.dart';

class SignUpController extends OtpController {
  var isLoading = false;

  Future<void> validateNumber(SignUpRequest signUpRequest) async {
    final isSuccess = await genarateOtp(
      signUpRequest.customerMobile!,
      isSignUp: true,
    );

    if (isSuccess) {
      Get.to(
        () => OtpEnterScreen(
          phoneNumber: signUpRequest.customerMobile!,
          signUpRequest: signUpRequest,
        ),
      );
    }
  }

  Future signUp(SignUpRequest signUpRequest) async {
    isLoading = true;
    update();
    try {
      final res = await AppRepository().signUp(signUpRequest);
      if (res.success == true) {
        Get.back();
        Get.back();
        Fluttertoast.showToast(msg: 'Registraion Successful');
      } else {
        final error = handleError(res.error);
        await errorDialog(error);
      }
    } catch (e) {
      final error = handleError(e);
      await errorDialog(error);
      Get.back();
    } finally {
      isLoading = false;
      update();
    }
  }
}
