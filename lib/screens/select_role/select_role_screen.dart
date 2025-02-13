import 'package:flutter/material.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/constants/constants.dart';
import 'package:mechtronz/constants/tags.dart';
import 'package:mechtronz/utils/text_preset.dart';
import 'package:mechtronz/screens/select_role/widget/select_role_container.dart';
import 'package:mechtronz/utils/helper.dart';
import 'package:mechtronz/global/widgets/screen.dart';
import 'package:mechtronz/global/widgets/v_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectRoleScreen extends StatefulWidget {
  const SelectRoleScreen({super.key});

  @override
  State<SelectRoleScreen> createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen> {
  @override
  Widget build(BuildContext context) {
    return Screen(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            VGap(gap: 50.h),
            Hero(
              tag: Tags.logo,
              child: Image.asset(
                'assets/images/logo.png',
                height: 100.h,
                width: 100.h,
              ),
            ),
            VGap(gap: 30.h),
            Padding(
              padding: kHPadding,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Choose your role below ${Helper.isSmallDevice()}',
                  style: kHeadline1,
                ),
              ),
            ),
            // const VGap(),
            const SelectRoleContainer(isCustomer: true),
            VGap(gap: 30.h),
            Text(
              'or',
              style: kHeadline3.copyWith(color: AppColors.gray500),
            ),
            const SelectRoleContainer(isCustomer: false),
          ],
        ));
  }
}
