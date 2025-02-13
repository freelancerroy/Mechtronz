import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/constants/constants.dart';
import 'package:mechtronz/utils/text_preset.dart';
import 'package:mechtronz/global/widgets/h_gap.dart';
import 'package:mechtronz/global/widgets/tochable_opacity.dart';
import 'package:mechtronz/global/widgets/v_gap.dart';

class Header extends StatelessWidget {
  final String? title;
  final Widget? leading;
  const Header({
    super.key,
    this.title,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leading ??
            TouchableOpacity(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                width: 40.w,
                child: Padding(
                  padding: kVPadding,
                  child: Icon(
                    Icons.arrow_back_rounded,
                    size: 20.w,
                  ),
                ),
              ),
            ),
        const Spacer(),
        if (title != null)
          Text(
            title!,
            style: kSubtitle2.copyWith(color: AppColors.gray400),
          ),
        const Spacer(),
        HGap(gap: 40.w),
        VGap(gap: 40.h),
      ],
    );
  }
}
