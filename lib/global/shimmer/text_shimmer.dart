import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class TextShimmer extends StatelessWidget {
  const TextShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[100]!,
      highlightColor: Colors.white,
      child: Container(
        height: 20.h,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
    );
  }
}
