import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:mechtronz/global/shimmer/grid_shimmer.dart';
import 'package:mechtronz/global/widgets/header.dart';
import 'package:mechtronz/global/widgets/paginated_grid_view.dart';
import 'package:mechtronz/global/widgets/screen.dart';
import 'package:mechtronz/screens/assets/controller/asset_controller.dart';
import 'package:mechtronz/screens/assets/widget/asset_type_grid.dart';

class AssetsTypeScreen extends StatefulWidget {
  const AssetsTypeScreen({super.key});

  @override
  State<AssetsTypeScreen> createState() => _AssetsTypeScreenState();
}

class _AssetsTypeScreenState extends State<AssetsTypeScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
        (_) => Get.find<AssetController>().getAllAssetsType());
  }

  @override
  void dispose() {
    super.dispose();
    Get.find<AssetController>()
      ..assetsTypeList.clear()
      ..limit = 20
      ..skip = 0
      ..isAssetsTypeLoading = false
      ..isAllLoaded = false;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssetController>(
        init: AssetController(),
        builder: (controller) {
          return Screen(
              child: Column(
            children: [
              const Header(title: 'Select Asset Type'),
              Expanded(
                child: PaginatedGridView(
                  itemBuilder: (BuildContext context, int index) {
                    if (index >= controller.assetsTypeList.length) {
                      return const GridShimmer();
                    }
                    return AssetTypeGrid(
                      controller.assetsTypeList[index],
                    );
                  },
                  itemCount: controller.assetsTypeList.length +
                      (controller.isAllLoaded ? 0 : 2),
                  onRefresh: () {
                    print('Refresh Items');
                  },
                  onLoadMore: () {
                    controller.getAllAssetsType();
                  },
                ),
              )
            ],
          ));
        });
  }
}
