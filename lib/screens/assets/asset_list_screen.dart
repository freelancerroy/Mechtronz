import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mechtronz/constants/app_colors.dart';
import 'package:mechtronz/global/widgets/paginated_list_view.dart';
import 'package:mechtronz/screens/assets/assets_type_screen.dart';
import 'package:mechtronz/screens/assets/controller/asset_controller.dart';
import 'package:mechtronz/screens/assets/create_assets_screen.dart';
import 'package:mechtronz/screens/assets/widget/asset_tile.dart';
import 'package:mechtronz/screens/home/home_screen.dart';
import 'package:mechtronz/global/widgets/app_drawer.dart';
import 'package:mechtronz/global/widgets/header.dart';
import 'package:mechtronz/global/widgets/screen.dart';
import 'package:mechtronz/global/widgets/v_gap.dart';

class AssetListScreen extends StatefulWidget {
  const AssetListScreen({super.key});

  @override
  State<AssetListScreen> createState() => _AssetListScreenState();
}

class _AssetListScreenState extends State<AssetListScreen> {
  final _assetController = Get.put(AssetController());

  @override
  void initState() {
    super.initState();
    _assetController.assetListResetPage();
    _assetController.getAssetsList();
  }

  final GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssetController>(
        init: AssetController(),
        builder: (controller) {
          return Screen(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              Get.offAll(() => const HomeScreen());
            },
            uniqueKey: key,
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: AppColors.primary,
              onPressed: () {
                final s = Get.to(() => const AssetsTypeScreen());
                print('ss,$s');
              },
              label: const Text('Add Assets'),
              icon: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            drawer: AppDrawer(
              scaffoldKey: key,
              activeScreen: ActiveScreenEnum.profile,
            ),
            child: controller.isListLoading && controller.assetList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Header(
                        leading: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            key.currentState!.isDrawerOpen
                                ? key.currentState!.closeDrawer()
                                : key.currentState!.openDrawer();
                          },
                          child: SizedBox(
                            width: 40.w,
                            child: const Icon(Icons.menu),
                          ),
                        ),
                        title: 'Mechtronz',
                      ),
                      Expanded(
                        child: PaginatedListView(
                          padding: EdgeInsets.only(bottom: 50.h),
                          separatorBuilder: (context, index) => const VGap(),
                          itemCount: controller.assetList.length +
                              (controller.isAllLoadedAssetsList ? 0 : 1),
                          onLoadMore: () {
                            controller.getAssetsList();
                          },
                          onRefresh: () {
                            controller.assetListResetPage();
                            controller.getAssetsList();
                          },
                          itemBuilder: (context, index) {
                            if (index >= controller.assetList.length) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return AssetTile(
                              controller.assetList[index],
                              onDelete: () {
                                controller.deleteAsset(
                                  controller.assetList[index].id ?? -1,
                                );
                              },
                              onEdit: () {
                                Get.to(() => CreateAssetsScreen(
                                      asset: controller.assetList[index],
                                    ));
                              },
                              isDisabled: controller.disableId ==
                                  controller.assetList[index].id,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          );
        });
  }
}
