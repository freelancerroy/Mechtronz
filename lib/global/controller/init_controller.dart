import 'package:get/get.dart';
import 'package:mechtronz/data/local/pref_strings.dart';
import 'package:mechtronz/data/local/preference_connector.dart';
import 'package:mechtronz/screens/home/home_screen.dart';
import 'package:mechtronz/screens/select_role/select_role_screen.dart';

class InitController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  bool isLogedIn = false;
  bool isCustomer = false;
  String? token;
  int? id;

  Future<void> initialize() async {
    token = await PrefConnector().getString(PrefStrings.token);
    id = await PrefConnector().getInt(PrefStrings.id);
    if (token != null && id != null) {
      isLogedIn = true;
    }
    Future.delayed(const Duration(seconds: 1), () {
      if (isLogedIn) {
        Get.offAll(
          () => const HomeScreen(),
        );
      } else {
        Get.offAll(() => const SelectRoleScreen());
      }
    });
  }

  void signOut() {
    PrefConnector().clear();
    isLogedIn = false;
    Get.offAll(() => const SelectRoleScreen());
  }

  Future<void> signIn({
    required String token,
    required int id,
    required bool isCustomer,
  }) async {
    await PrefConnector().setString(PrefStrings.token, token);
    await PrefConnector().setInt(PrefStrings.id, id);
    await PrefConnector().setBool(PrefStrings.isCustomer, isCustomer);
    isLogedIn = true;
    this.token = token;
    this.id = id;
    this.isCustomer = isCustomer;
    Get.offAll(() => const HomeScreen());
  }

  void setRole(bool isCustomer) {
    this.isCustomer = this.isCustomer;
    update();
  }
}
