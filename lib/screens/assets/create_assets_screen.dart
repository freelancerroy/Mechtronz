import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mechtronz/constants/api_endpoints.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/constants/constants.dart';
import 'package:mechtronz/global/widgets/h_gap.dart';
import 'package:mechtronz/global/widgets/tochable_opacity.dart';
import 'package:mechtronz/modal/assets/asset_response.dart';
import 'package:mechtronz/modal/assets/assets_type.dart';
import 'package:mechtronz/modal/assets/create_assets_request.dart';
import 'package:mechtronz/screens/assets/controller/asset_controller.dart';
import 'package:mechtronz/global/widgets/custom_text_field.dart';
import 'package:mechtronz/global/widgets/header.dart';
import 'package:mechtronz/global/widgets/screen.dart';
import 'package:mechtronz/global/widgets/v_gap.dart';
import 'package:mechtronz/utils/picker.dart';
import 'package:mechtronz/utils/shadows.dart';
import 'package:mechtronz/utils/text_preset.dart';
import 'package:mechtronz/utils/validator.dart';
import 'package:dio/dio.dart' as dio;

import '../../global/widgets/button.dart';

class CreateAssetsScreen extends StatefulWidget {
  final Assets? asset;
  final AssetType? assetsType;
  const CreateAssetsScreen({
    super.key,
    this.asset,
    this.assetsType,
  });
  @override
  State<CreateAssetsScreen> createState() => _CreateAssetsScreenState();
}

class _CreateAssetsScreenState extends State<CreateAssetsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _assetNameController = TextEditingController();
  final _brandNameController = TextEditingController();
  final _machineTypeController = TextEditingController();
  final _capacityController = TextEditingController();
  final _uinController = TextEditingController();
  final _machineLocationController = TextEditingController();
  File? image;
  String? networkImage;
  String? imageErrorText;
  AssetType? assetsType;

  @override
  void initState() {
    super.initState();
    if (widget.asset != null) {
      _assetNameController.text = widget.asset?.assetName ?? '';
      _brandNameController.text = widget.asset?.brandName ?? '';
      _machineTypeController.text = widget.asset?.machineType ?? '';
      _capacityController.text =
          widget.asset?.capacityTonnage?.toString() ?? '';
      _uinController.text = widget.asset?.uin ?? '';
      _machineLocationController.text = widget.asset?.machineLocation ?? '';
      networkImage = ApiEndpoints.url(widget.asset?.assetImagePath ?? '');
      getAssetType();
    } else {
      setState(() {
        assetsType = widget.assetsType;
      });
    }
  }

  getAssetType() async {
    assetsType = await Get.find<AssetController>()
        .getAssetsType(widget.asset?.assetTypeId ?? -1);
    setState(() {});
  }

  @override
  void dispose() {
    _assetNameController.dispose();
    _brandNameController.dispose();
    _machineTypeController.dispose();
    _capacityController.dispose();
    _uinController.dispose();
    _machineLocationController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (image == null && networkImage == null) {
      imageErrorText = 'Please select an image';
    } else {
      imageErrorText = null;
    }
    setState(() {});
    if (_formKey.currentState!.validate() && imageErrorText == null) {
      if (widget.asset != null) {
        Get.find<AssetController>().updateAsset(
          CreateAssetsRequest(
            assetName: _assetNameController.text,
            assetImagePath: image == null
                ? null
                : await dio.MultipartFile.fromFile(image!.path,
                    filename: image!.path.split('/').last),
            assetTypeId: assetsType?.id,
            brandName: _brandNameController.text,
            machineType: _machineTypeController.text,
            capacityTonnage: double.tryParse(_capacityController.text),
            uin: _uinController.text,
            machineLocation: _machineLocationController.text,
          ),
          widget.asset!.id!,
        );
      } else {
        Get.find<AssetController>().createAsset(
          CreateAssetsRequest(
            assetName: _assetNameController.text,
            assetImagePath: await dio.MultipartFile.fromFile(image!.path,
                filename: image!.path.split('/').last),
            assetTypeId: assetsType?.id,
            brandName: _brandNameController.text,
            machineType: _machineTypeController.text,
            capacityTonnage: double.tryParse(_capacityController.text),
            uin: _uinController.text,
            machineLocation: _machineLocationController.text,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssetController>(
        init: AssetController(),
        builder: (controller) {
          return Screen(
            footer: Padding(
              padding: kPadding,
              child: Button(
                loader: controller.isLoading,
                onPressed: _submitForm,
                text: 'Submit',
              ),
            ),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Header(
                    title: widget.asset == null ? 'Add Asset' : 'Edit Asset',
                  ),
                  if (assetsType != null)
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: kBorderRadius,
                        boxShadow: kBottomLightShadow,
                      ),
                      child: Padding(
                        padding: kPadding,
                        child: SizedBox(
                          height: 50.w,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                ApiEndpoints.url(
                                    assetsType?.assetTypeImage ?? ''),
                                width: 50.w,
                                height: 50.w,
                                fit: BoxFit.contain,
                              ),
                              const HGap(),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      assetsType?.assetTypeName ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: kSubtitle2.copyWith(
                                        color: AppColors.gray700,
                                      ),
                                    ),
                                    if (assetsType?.assetTypeDescription !=
                                        null)
                                      Text(
                                        assetsType?.assetTypeDescription ?? '',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: kSubtitle3.copyWith(
                                          color: AppColors.gray600,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  const VGap(),
                  CustomTextField(
                    controller: _assetNameController,
                    label: 'Asset Name',
                    validator: Validator.isNotEmpty,
                  ),
                  const VGap(),
                  CustomTextField(
                    controller: _brandNameController,
                    label: 'Brand Name',
                    validator: Validator.isNotEmpty,
                  ),
                  const VGap(),
                  CustomTextField(
                    controller: _machineTypeController,
                    label: 'Machine Type',
                    validator: Validator.isNotEmpty,
                  ),
                  const VGap(),
                  CustomTextField(
                    controller: _capacityController,
                    keyboardType: TextInputType.number,
                    label: 'Capacity (Tonnage)',
                    validator: Validator.isNotEmpty,
                  ),
                  const VGap(),
                  CustomTextField(
                    controller: _uinController,
                    label: 'UIN',
                    validator: Validator.isNotEmpty,
                  ),
                  const VGap(),
                  CustomTextField(
                    controller: _machineLocationController,
                    label: 'Machine Location',
                    validator: Validator.isNotEmpty,
                  ),
                  const VGap(),
                  // Container(
                  //   padding: const EdgeInsets.all(13),
                  //   decoration: BoxDecoration(
                  //     color: AppColors.white,
                  //     borderRadius: kBorderRadius,
                  //     border: Border.all(
                  //       color: AppColors.gray400,
                  //     ),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       TouchableOpacity(
                  //         onTap: () async {
                  //           final pickedImages = await imagePicker(1);
                  //           if (pickedImages != null) {
                  //             setState(() {
                  //               image = pickedImages.firstOrNull;
                  //             });
                  //           }
                  //         },
                  //         child: Container(
                  //           padding: EdgeInsets.symmetric(
                  //               horizontal: 10.w, vertical: 5.h),
                  //           margin: EdgeInsets.only(right: 10.h),
                  //           decoration: BoxDecoration(
                  //             border: Border.all(
                  //               color: AppColors.gray500,
                  //             ),
                  //             color: AppColors.gray200,
                  //             borderRadius: kBorderRadius,
                  //           ),
                  //           child: Text('Choose File', style: kCaption),
                  //         ),
                  //       ),
                  //       Expanded(
                  //         child: Text(
                  //           image != null
                  //               ? image!.path.split('/').last
                  //               : 'No file chosen',
                  //           maxLines: 1,
                  //           overflow: TextOverflow.ellipsis,
                  //           style: kBody.copyWith(
                  //             color: image != null
                  //                 ? AppColors.black
                  //                 : AppColors.gray400,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  image != null || networkImage != null
                      ? Align(
                          alignment: Alignment.topLeft,
                          child: Badge(
                            label: TouchableOpacity(
                              onTap: () {
                                setState(() {
                                  image = null;
                                  networkImage = null;
                                });
                              },
                              child: CircleAvatar(
                                radius: 12.w,
                                backgroundColor: AppColors.white,
                                child: CircleAvatar(
                                  radius: 10.w,
                                  backgroundColor: AppColors.negative,
                                  child: Icon(
                                    Icons.close,
                                    color: AppColors.white,
                                    size: 16.w,
                                  ),
                                ),
                              ),
                            ),
                            offset: Offset(-2.w, -2.w),
                            backgroundColor: Colors.transparent,
                            child: Container(
                              height: 125.w,
                              width: 125.w,
                              decoration: BoxDecoration(
                                borderRadius: kBorderRadius,
                                image: DecorationImage(
                                  image: networkImage != null
                                      ? NetworkImage(networkImage!)
                                      : FileImage(image!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        )
                      : TouchableOpacity(
                          onTap: () async {
                            final pickedImages = await imagePicker(1);
                            if (pickedImages != null) {
                              setState(() {
                                image = pickedImages.firstOrNull;
                              });
                            }
                          },
                          child: Container(
                            height: 125.w,
                            width: 125.w,
                            // padding: EdgeInsets.symmetric(vertical: 10.h),
                            decoration: BoxDecoration(
                              borderRadius: kBorderRadius,
                              color: AppColors.gray100,
                              border: Border.all(
                                color: AppColors.gray200,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.cloud_upload_outlined,
                                  color: AppColors.gray400,
                                ),
                                const HGap(),
                                Text(
                                  'Upload Image',
                                  style: kBody.copyWith(
                                    color: AppColors.gray400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                  if (imageErrorText != null)
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Text(
                        imageErrorText!,
                        style: kCaption.copyWith(
                          color: AppColors.negative,
                        ),
                      ),
                    ),
                  // Container(
                  //   padding: EdgeInsets.only(bottom: 10.h),
                  //   width: double.infinity,
                  //   child: Wrap(
                  //     alignment: WrapAlignment.start,
                  //     crossAxisAlignment: WrapCrossAlignment.start,
                  //     children: [
                  //       if (image != null)
                  //         ...images.map((image) => ),
                  //       if (images.length < 5)
                  //         Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: TouchableOpacity(
                  //             onTap: () async {
                  //               final pickedImages = await imagePicker(1);
                  //               if (pickedImages != null) {
                  //                 setState(() {
                  //                   images.addAll(pickedImages);
                  //                 });
                  //               }
                  //             },
                  //             child: Container(
                  //               height: 125.w,
                  //               width: 125.w,
                  //               // padding: EdgeInsets.symmetric(vertical: 10.h),
                  //               decoration: BoxDecoration(
                  //                 borderRadius: kBorderRadius,
                  //                 color: AppColors.gray100,
                  //                 border: Border.all(
                  //                   color: AppColors.gray200,
                  //                 ),
                  //               ),
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   const Icon(
                  //                     Icons.cloud_upload_outlined,
                  //                     color: AppColors.gray400,
                  //                   ),
                  //                   const HGap(),
                  //                   Text(
                  //                     'Upload Image',
                  //                     style: kBody.copyWith(
                  //                       color: AppColors.gray400,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          );
        });
  }
}
