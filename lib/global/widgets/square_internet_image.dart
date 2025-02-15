import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechtronz/constants/api_endpoints.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/constants/constants.dart';

class SquareInternetImage extends StatelessWidget {
  const SquareInternetImage({
    super.key,
    required this.imgURL,
    this.size,
  });

  final String? imgURL;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: kBorderRadius,
      child: Image.network(
        ApiEndpoints.url(imgURL ?? ''),
        errorBuilder: (context, error, stackTrace) => Container(
          decoration: BoxDecoration(
            color: AppColors.gray100,
            borderRadius: kBorderRadius,
          ),
          width: size,
          height: size,
          child: Icon(
            Icons.image_not_supported,
            color: AppColors.gray400,
            size: size != null ? (size! / 2).clamp(0, 40.w) : 40.w,
          ),
        ),
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
