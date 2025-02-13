import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mechtronz/constants/api_endpoints.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/constants/constants.dart';
import 'package:mechtronz/global/widgets/h_gap.dart';
import 'package:mechtronz/global/widgets/tochable_opacity.dart';
import 'package:mechtronz/global/widgets/v_gap.dart';
import 'package:mechtronz/modal/assets/asset_response.dart';
import 'package:mechtronz/utils/text_preset.dart';

class AssetTile extends StatefulWidget {
  final Assets asset;
  final Function() onEdit;
  final Function() onDelete;
  final bool isDisabled;
  const AssetTile(
    this.asset, {
    super.key,
    required this.onEdit,
    required this.onDelete,
    this.isDisabled = false,
  });

  @override
  State<AssetTile> createState() => _AssetTileState();
}

class _AssetTileState extends State<AssetTile> {
  bool isShowMore = false;
  bool startAnimation = false;
  double height = 80.w;
  double width = 80.w;
  Widget imageBox(String? path) {
    return AnimatedContainer(
      width: width,
      height: height,
      duration: const Duration(milliseconds: 300),
      child: SquareInternetImage(
        imgURL: path,
        size: width,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.isDisabled ? 0.3 : 1,
      child: Slidable(
        closeOnScroll: true,
        enabled: !widget.isDisabled,
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (ctx) {
                widget.onEdit();
              },
              backgroundColor: AppColors.info,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.5.w),
                bottomLeft: Radius.circular(5.5.w),
              ),
            ),
            SlidableAction(
              onPressed: (ctx) {
                widget.onDelete();
              },
              backgroundColor: AppColors.negative,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.5.w),
                bottomRight: Radius.circular(5.5.w),
              ),
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: kBorderRadius,
            border: Border.all(
              color: AppColors.gray300,
            ),
          ),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 300),
            child: Column(
              children: [
                Padding(
                  padding: kPadding.copyWith(bottom: 0),
                  child: isShowMore
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            imageBox(widget.asset.assetImagePath),
                            const VGap(),
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity: startAnimation ? 0 : 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.asset.assetName ?? '',
                                    style: kHeadline3,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  RichText(
                                      text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: widget.asset.brandName ?? '',
                                        style: kSubtitle2.copyWith(
                                          color: AppColors.gray500,
                                        ),
                                      ),
                                      if (widget.asset.machineType != null)
                                        TextSpan(
                                          text:
                                              '(${widget.asset.machineType ?? ''})',
                                          style: kCaption.copyWith(
                                            color: AppColors.gray500,
                                          ),
                                        ),
                                    ],
                                  )),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: RichText(
                                            text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Capacity: ',
                                              style: kBody.copyWith(
                                                color: AppColors.gray400,
                                              ),
                                            ),
                                            TextSpan(
                                              text: widget.asset.capacityTonnage
                                                  .toString(),
                                              style: kBody.copyWith(
                                                color: AppColors.gray400,
                                              ),
                                            ),
                                          ],
                                        )),
                                      ),
                                      Expanded(
                                        child: RichText(
                                            textDirection: TextDirection.rtl,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'UIN: ',
                                                  style: kBody.copyWith(
                                                    color: AppColors.gray400,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: widget.asset.uin,
                                                  style: kBody.copyWith(
                                                    color: AppColors.gray400,
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on, size: 14),
                                      HGap(gap: 5.w),
                                      Expanded(
                                        child: Text(
                                          widget.asset.machineLocation ?? '',
                                          style: kBody,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            imageBox(widget.asset.assetImagePath),
                            const HGap(),
                            Expanded(
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 200),
                                opacity: startAnimation ? 0 : 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.asset.assetName ?? '',
                                      style: kHeadline3,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    // const VGap(),
                                    Text(
                                      widget.asset.brandName ?? '',
                                      style: kSubtitle2.copyWith(
                                          color: AppColors.gray400),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    VGap(gap: 5.h),
                                    Row(
                                      children: [
                                        const Icon(Icons.location_on, size: 14),
                                        HGap(gap: 5.w),
                                        Expanded(
                                          child: Text(
                                            widget.asset.machineLocation ?? '',
                                            style: kBody,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
                const VGap(),
                TouchableOpacity(
                  onTap: () {
                    setState(() {
                      startAnimation = true;
                      height = !isShowMore ? 330.w : 80.w;
                      width = !isShowMore ? 330.w : 80.w;
                      Future.delayed(const Duration(milliseconds: 300), () {
                        setState(() {
                          isShowMore = !isShowMore;
                          startAnimation = false;
                        });
                      });
                    });
                  },
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Show ${isShowMore ? 'Less' : 'More'}',
                            style: kCaption.copyWith(color: AppColors.gray300)),
                        AnimatedRotation(
                          duration: const Duration(milliseconds: 300),
                          turns: isShowMore ? 1 : 0,
                          child: Icon(
                            isShowMore
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: AppColors.gray300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
