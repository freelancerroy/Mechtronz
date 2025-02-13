import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mechtronz/constants/assets.dart';
import 'package:mechtronz/constants/tags.dart';
import 'package:mechtronz/global/controller/init_controller.dart';
import 'package:mechtronz/global/widgets/screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Get.put(InitController());
    return Screen(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Hero(
            tag: Tags.logo,
            child: Image.asset(
              AssetsImage.logo,
              width: 200.w,
              height: 200.w,
            ),
          ),
        ),
      ),
    );
  }
}
