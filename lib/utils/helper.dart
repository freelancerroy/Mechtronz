import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helper {
  static void navigate(BuildContext context, Widget page, {Bindings? binding}) {
    Get.to(page, binding: binding);
  }

  static void navigateAndRemoveAll(BuildContext context, Widget page) {
    Get.offAll(page);
  }

  static bool isSmallDevice() {
    final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return data.size.shortestSide <= 360;
  }
}
