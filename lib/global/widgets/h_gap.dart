import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HGap extends StatelessWidget {
  final double? gap;
  const HGap({this.gap, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: gap ?? 10.w);
  }
}
