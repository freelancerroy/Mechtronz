import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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

  static String getFormattedDate(DateTime date) {
    DateFormat formatter = DateFormat('dd MMM yyyy');
    return formatter.format(date);
  }

  static String? getFormattedDateFromString(String dateStr) {
    final date = DateTime.tryParse(dateStr);
    return date == null ? null : getFormattedDate(date);
  }
}
