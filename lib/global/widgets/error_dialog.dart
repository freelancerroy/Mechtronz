import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/constants/constants.dart';
import 'package:mechtronz/global/widgets/h_gap.dart';
import 'package:mechtronz/global/widgets/v_gap.dart';
import 'package:mechtronz/utils/text_preset.dart';

Future<dynamic> errorDialog(String error) {
  return Get.dialog(
      barrierDismissible: false,
      PopScope(
        canPop: false,
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 0, color: Colors.white),
                  borderRadius: kBorderRadius.copyWith(
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.h),
                      decoration: BoxDecoration(
                        border: Border.all(width: 0, color: AppColors.negative),
                        color: AppColors.negative,
                        borderRadius: kBorderRadius,
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.error,
                            color: Colors.white,
                          ),
                          HGap(),
                          Text(
                            'Error',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    VGap(gap: 30.h),
                    Padding(
                      padding: kHPadding,
                      child: Text(error),
                    ),
                    VGap(gap: 30.h),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 30.h,
                child: Stack(
                  children: [
                    Container(
                      height: 15.h,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0, color: Colors.white),
                        color: AppColors.white,
                        borderRadius: kBorderRadius.copyWith(
                          topRight: Radius.zero,
                          topLeft: Radius.zero,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 30.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            borderRadius: kBorderRadius,
                            color: AppColors.negative,
                          ),
                          child: Center(
                            child: Text(
                              'Close',
                              style: kCaption.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ));
}
