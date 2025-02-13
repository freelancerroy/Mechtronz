import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VGap extends StatelessWidget {
  final double? gap;
  const VGap({this.gap, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: gap ?? 10.w);
  }
}
