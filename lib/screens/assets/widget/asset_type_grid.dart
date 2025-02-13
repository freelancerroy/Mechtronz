import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mechtronz/constants/api_endpoints.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/constants/constants.dart';
import 'package:mechtronz/global/widgets/tochable_opacity.dart';
import 'package:mechtronz/modal/assets/assets_type.dart';
import 'package:mechtronz/screens/assets/create_assets_screen.dart';
import 'package:mechtronz/utils/shadows.dart';
import 'package:mechtronz/utils/text_preset.dart';

class AssetTypeGrid extends StatelessWidget {
  final AssetType assetsType;
  const AssetTypeGrid(
    this.assetsType, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () {
        Get.off(() => CreateAssetsScreen(assetsType: assetsType));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        decoration: BoxDecoration(
          boxShadow: kBottomLightShadow,
          color: AppColors.white,
          borderRadius: kBorderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  ApiEndpoints.url(assetsType.assetTypeImage ?? ''),
                ),
              ),
              Text(
                assetsType.assetTypeName ?? '',
                style: kSubtitle2.copyWith(
                  color: AppColors.gray600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
