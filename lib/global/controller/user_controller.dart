import 'package:get/get.dart';
import 'package:mechtronz/data/network/app_repository.dart';
import 'package:mechtronz/data/network/handle_error.dart';
import 'package:mechtronz/global/controller/init_controller.dart';
import 'package:mechtronz/global/widgets/error_dialog.dart';
import 'package:mechtronz/modal/user_response.dart';

class UserController extends GetxController {
  UserResult? userResult;
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  Future<void> getUser() async {
    final id = Get.find<InitController>().id;
    try {
      isLoading = true;
      update();
      if (id != null) {
        final response = await AppRepository().getUser(id);
        userResult = response.result;
        update();
      }
    } catch (e) {
      errorDialog(handleError(e));
    } finally {
      isLoading = false;
      update();
    }
  }
}
