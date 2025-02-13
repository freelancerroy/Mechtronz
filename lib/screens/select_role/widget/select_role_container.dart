import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/constants/assets.dart';
import 'package:mechtronz/constants/constants.dart';
import 'package:mechtronz/utils/shadows.dart';
import 'package:mechtronz/utils/text_preset.dart';
import 'package:mechtronz/screens/sign_in/sign_in_screen.dart';
import 'package:mechtronz/utils/helper.dart';
import 'package:mechtronz/global/widgets/tochable_opacity.dart';

class SelectRoleContainer extends StatelessWidget {
  final bool isCustomer;
  const SelectRoleContainer({
    super.key,
    required this.isCustomer,
  });

  @override
  Widget build(BuildContext context) {
    final kHight = 142.h;
    final kInnerHeight = 115.h;
    return TouchableOpacity(
      onTap: () {
        Helper.navigate(context, SignInScreen(isCustomer: isCustomer));
      },
      child: SizedBox(
        width: double.infinity,
        height: kHight,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: kInnerHeight,
                margin: kHPadding,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(25.r),
                  border: Border.all(color: AppColors.black, width: 1),
                  boxShadow:
                      isCustomer ? kBottomMediumShadow : kTopMediumShadow,
                ),
                padding: EdgeInsets.only(
                  left: isCustomer ? 5.w : 0.w,
                  bottom: isCustomer ? 5.w : 0.w,
                  right: isCustomer ? 0.w : 5.w,
                  top: isCustomer ? 0.w : 5.w,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                    color: AppColors.primary,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Align(
                      alignment: isCustomer
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Text(
                        isCustomer ? 'Customer' : 'Technician',
                        style: kHeadline2.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            isCustomer
                ? Positioned(
                    bottom: 0,
                    left: 40.w,
                    child: SvgPicture.asset(AssetsSvg.customer, height: kHight),
                  )
                : Positioned(
                    bottom: 0,
                    right: 40.w,
                    child: Transform.flip(
                      flipX: true,
                      child: SvgPicture.asset(
                        AssetsSvg.technician,
                        height: kHight + 30.h,
                      ),
                    ),
                  ),
            // Positioned(
            //   bottom: (kInnerHeight) / 2 - (kHeadline2.fontSize ?? 0),
            //   right: isCustomer ? 50.w : null,
            //   left: isCustomer ? null : 50.w,
            //   child: Text(
            //     isCustomer ? 'Customer' : 'Technician',
            //     style: kHeadline2.copyWith(
            //       color: AppColors.white,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
