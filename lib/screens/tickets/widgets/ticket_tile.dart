import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/global/widgets/h_gap.dart';
import 'package:mechtronz/utils/text_preset.dart';

class TicketTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Widget? child;
  final CrossAxisAlignment? crossAxisAlignment;
  const TicketTile({
    super.key,
    required this.title,
    this.value = '',
    required this.icon,
    this.child,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.gray300, size: 20.w),
        HGap(gap: 5.w),
        Text(title, style: kSubtitle2),
        HGap(gap: 5.w),
        child ??
            Expanded(
              child: Text(value, style: kSubtitle2),
            ),
      ],
    );
  }
}
