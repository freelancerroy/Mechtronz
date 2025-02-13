import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/constants/constants.dart';
import 'package:mechtronz/global/widgets/h_gap.dart';
import 'package:mechtronz/global/widgets/paginated_list_view.dart';
import 'package:mechtronz/global/widgets/tochable_opacity.dart';
import 'package:mechtronz/modal/assets/asset_response.dart';
import 'package:mechtronz/screens/assets/controller/asset_controller.dart';
import 'package:mechtronz/global/widgets/custom_text_field.dart';
import 'package:mechtronz/global/widgets/header.dart';
import 'package:mechtronz/global/widgets/screen.dart';
import 'package:mechtronz/global/widgets/v_gap.dart';
import 'package:mechtronz/screens/assets/widget/asset_tile.dart';
import 'package:mechtronz/screens/tickets/ticket_details_screen.dart';
import 'package:mechtronz/utils/picker.dart';
import 'package:mechtronz/utils/text_preset.dart';
import 'package:mechtronz/utils/validator.dart';

import '../../global/widgets/button.dart';

class CreateTicketScreen extends StatefulWidget {
  const CreateTicketScreen({
    super.key,
  });
  @override
  State<CreateTicketScreen> createState() => _CreateTicketScreenState();
}

class _CreateTicketScreenState extends State<CreateTicketScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _contactPersonController = TextEditingController();

  List<Assets> assetList = [];
  bool isLoading = false;
  Assets? _selectedAsset;
  int _currentStep = 0;
  List<File> images = [];

  @override
  void initState() {
    super.initState();
    getAssetsList();
  }

  Future<void> getAssetsList() async {
    setState(() {
      isLoading = true;
    });
    // assetList = await _assetController.getAssetsList();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _contactPersonController.dispose();

    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Get.find<AssetController>().createAsset(
      //   CreateAssetsRequest(
      //     brandName: _brandNameController.text,
      //     machineType: _machineTypeController.text,
      //     capacityTonnage: int.tryParse(_capacityController.text),
      //     uin: _uinController.text,
      //     machineLocation: _machineLocationController.text,
      //   ),
      // );
    }
  }

  Step createStep(
      {required String title, required Widget content, required int step}) {
    return Step(
      isActive: _currentStep >= step,
      state: _currentStep == step
          ? StepState.editing
          : _currentStep > step
              ? StepState.complete
              : StepState.indexed,
      title: Text(title),
      content: content,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      padding: EdgeInsets.zero,
      // footer: Padding(
      //   padding: kPadding,
      //   child: Button(
      //     loader: isLoading,
      //     onPressed: _submitForm,
      //     text: 'Submit',
      //   ),
      // ),
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: kHPadding,
                    child: const Header(title: 'Create Ticket'),
                  ),
                  Stepper(
                    currentStep: _currentStep,
                    controlsBuilder: (context, details) => Row(
                      children: [
                        SizedBox(
                          width: _currentStep == 2 ? 100.w : 80.w,
                          height: 40.h,
                          child: Button(
                            disabled: _currentStep == 0
                                ? _selectedAsset == null
                                : _currentStep == 2 && images.isEmpty,
                            onPressed: () {
                              if (_currentStep == 1) {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    _currentStep += 1;
                                  });
                                } else {
                                  return;
                                }
                              } else if (_currentStep == 2) {
                                Get.off(
                                    () => TicketDetailsScreen(images: images));
                              } else {
                                setState(() {
                                  _currentStep += 1;
                                });
                              }
                            },
                            child: Text(
                              _currentStep == 2 ? 'Submit' : 'Next',
                              style: kBody.copyWith(color: AppColors.white),
                            ),
                          ),
                        ),
                        if (_currentStep != 0)
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _currentStep -= 1;
                              });
                            },
                            child: const Text('Back'),
                          ),
                      ],
                    ),
                    steps: [
                      createStep(
                        step: 0,
                        title: 'Select Asset',
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const VGap(),
                            InkWell(
                              borderRadius: kBorderRadius,
                              onTap: () {
                                final controller = Get.put(AssetController());
                                controller.assetListResetPage();
                                controller.getAssetsList();

                                Get.bottomSheet(
                                  backgroundColor: AppColors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: kBorderRadius,
                                  ),
                                  GetBuilder<AssetController>(
                                      init: AssetController(),
                                      builder: (controller) {
                                        return Column(
                                          children: [
                                            Container(
                                              color: AppColors.white,
                                              child: Header(
                                                  title: 'Select Asset',
                                                  leading:
                                                      SizedBox(width: 40.w)),
                                            ),
                                            Expanded(
                                              child: PaginatedListView(
                                                padding: EdgeInsets.only(
                                                    bottom: 50.h),
                                                separatorBuilder:
                                                    (context, index) => Padding(
                                                  padding: kHPadding,
                                                  child: const Divider(
                                                    color: AppColors.gray100,
                                                  ),
                                                ),
                                                itemCount: controller
                                                        .assetList.length +
                                                    (controller
                                                            .isAllLoadedAssetsList
                                                        ? 0
                                                        : 1),
                                                onLoadMore: () {
                                                  controller.getAssetsList();
                                                },
                                                onRefresh: () {
                                                  controller
                                                      .assetListResetPage();
                                                  controller.getAssetsList();
                                                },
                                                itemBuilder: (context, index) {
                                                  if (index >=
                                                      controller
                                                          .assetList.length) {
                                                    return const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    );
                                                  }
                                                  final asset = controller
                                                      .assetList[index];
                                                  return ListTile(
                                                    tileColor: asset.id ==
                                                            _selectedAsset?.id
                                                        ? AppColors
                                                            .secondary.shade50
                                                        : AppColors.white,
                                                    leading:
                                                        SquareInternetImage(
                                                      imgURL:
                                                          asset.assetImagePath,
                                                      size: 50.w,
                                                    ),
                                                    title: Text(
                                                      asset.assetName ?? '',
                                                      style: kSubtitle2,
                                                    ),
                                                    subtitle: Text(
                                                      asset.brandName ?? '',
                                                      style: kCaption.copyWith(
                                                        color:
                                                            AppColors.gray400,
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        _selectedAsset = asset;
                                                      });
                                                      Get.back();
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: kBorderRadius,
                                  border: Border.all(
                                    color: AppColors.gray400,
                                  ),
                                ),
                                padding: EdgeInsets.all(12.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(_selectedAsset?.assetName ??
                                        'Select Asset'),
                                    const Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                                // child: SearchableDropdown.paginated(
                                //   // showSearchBar: true,
                                //   hintText: const Text('Select asset'),
                                //   margin: const EdgeInsets.all(15),
                                //   paginatedRequest: (int page, _) async {
                                //     assetList = await _assetController
                                //         .getAssetsListByPageNo(page);
                                //     print(
                                //         'assetList: ${assetList.length} $page ');
                                //     return assetList
                                //         .map((e) => SearchableDropdownMenuItem(
                                //             value: e,
                                //             label: e.assetName ?? '',
                                //             child: Text(e.id.toString() ?? '')))
                                //         .toList();
                                //   },
                                //   requestItemCount: 22,
                                //   // requestItemCount: 25,
                                //   onChanged: (Assets? value) {
                                //     debugPrint('$value');
                                //   },
                                // ),
                              ),
                            ),
                            // DropdownButtonFormField<Assets>(
                            //   validator: (asset) =>
                            //       Validator.isNotEmpty(asset?.brandName),
                            //   value: _selectedAsset,
                            //   items: assetList
                            //       .map((e) => DropdownMenuItem(
                            //             value: e,
                            //             child: Text(
                            //               e.brandName ?? '',
                            //               style: kBody,
                            //             ),
                            //           ))
                            //       .toList(),
                            //   onChanged: (asset) {
                            //     setState(() {
                            //       _selectedAsset = asset;
                            //     });
                            //   },
                            //   style: kBody,
                            //   decoration: const InputDecoration(
                            //     labelText: 'Select asset',
                            //   ),
                            // ),
                            const VGap()
                          ],
                        ),
                      ),
                      createStep(
                        step: 1,
                        title: 'Details',
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description*',
                              style: kBody.copyWith(
                                color: AppColors.gray400,
                              ),
                            ),
                            CustomTextField(
                              controller: _descriptionController,
                              label: '',
                              validator: Validator.isNotEmpty,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              isDisabled: _selectedAsset == null,
                            ),
                            const VGap(),
                            Text(
                              'Contact Person Number*',
                              style: kBody.copyWith(
                                color: AppColors.gray400,
                              ),
                            ),
                            CustomTextField(
                              controller: _contactPersonController,
                              label: '',
                              validator: Validator.isNotEmpty,
                              keyboardType: TextInputType.phone,
                              isDisabled: _selectedAsset == null,
                            ),
                            const VGap(),
                          ],
                        ),
                      ),
                      createStep(
                        title: 'Upload Images',
                        content: Container(
                          padding: EdgeInsets.only(bottom: 10.h),
                          width: double.infinity,
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              if (images.isNotEmpty)
                                ...images.map((image) => Padding(
                                      padding: EdgeInsets.all(8.w),
                                      child: Badge(
                                        label: TouchableOpacity(
                                          onTap: () {
                                            setState(() {
                                              images.remove(image);
                                            });
                                          },
                                          child: CircleAvatar(
                                            radius: 12.w,
                                            backgroundColor: AppColors.white,
                                            child: CircleAvatar(
                                              radius: 10.w,
                                              backgroundColor:
                                                  AppColors.negative,
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
                                              image: FileImage(image),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                              if (images.length < 5)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TouchableOpacity(
                                    onTap: () async {
                                      final pickedImages =
                                          await imagePicker(5 - images.length);
                                      if (pickedImages != null) {
                                        setState(() {
                                          images.addAll(pickedImages);
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                ),
                            ],
                          ),
                        ),
                        step: 2,
                      )
                    ],
                  ),

                  // Text(
                  //   'Description*',
                  //   style: kBody.copyWith(
                  //     color: AppColors.gray400,
                  //   ),
                  // ),
                  // CustomTextField(
                  //   controller: _descriptionController,
                  //   label: '',
                  //   validator: Validator.isNotEmpty,
                  //   keyboardType: TextInputType.multiline,
                  //   maxLines: 5,
                  //   isDisabled: _selectedAsset == null,
                  // ),
                  // const VGap(),
                  // Text(
                  //   'Contact Person Number*',
                  //   style: kBody.copyWith(
                  //     color: AppColors.gray400,
                  //   ),
                  // ),
                  // CustomTextField(
                  //   controller: _machineTypeController,
                  //   label: '',
                  //   validator: Validator.isNotEmpty,
                  //   keyboardType: TextInputType.phone,
                  //   isDisabled: _selectedAsset == null,
                  // ),
                  const VGap(),
                ],
              ),
            ),
    );
  }
}
