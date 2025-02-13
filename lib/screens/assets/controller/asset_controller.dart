import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mechtronz/data/network/app_repository.dart';
import 'package:mechtronz/data/network/handle_error.dart';
import 'package:mechtronz/global/widgets/error_dialog.dart';
import 'package:mechtronz/modal/assets/asset_response.dart';
import 'package:mechtronz/modal/assets/assets_type.dart';
import 'package:mechtronz/modal/assets/create_assets_request.dart';
import 'package:mechtronz/modal/id_request.dart';

class AssetController extends GetxController {
  bool isLoading = false;
  bool isListLoading = false;
  int? disableId;
  List<Assets> assetList = [];
  List<AssetType> assetsTypeList = [];
  bool isAssetsTypeLoading = false;
  int limit = 20;
  int skip = 0;
  bool isAllLoaded = false;
  final int _assetListLimit = 20;
  int _assetListSkip = 0;
  bool isAllLoadedAssetsList = false;

  void createAsset(CreateAssetsRequest createAssetsRequest) async {
    isLoading = true;
    update();
    try {
      final res = await AppRepository().createAssets(createAssetsRequest);
      if (res.success == true && res.result != null) {
        Fluttertoast.showToast(msg: 'Asset created successfully');
        Get.back();
        assetListResetPage();
        getAssetsList();
      } else {
        final error = handleError(res.error);
        await errorDialog(error);
      }
    } catch (e) {
      final error = handleError(e);
      await errorDialog(error);
    } finally {
      isLoading = false;
      update();
    }
  }

  void updateAsset(CreateAssetsRequest createAssetsRequest, int id) async {
    isLoading = true;
    update();
    try {
      final res = await AppRepository().updateAsset(createAssetsRequest, id);
      if (res.success == true && res.result != null) {
        Fluttertoast.showToast(msg: 'Asset updated');
        assetListResetPage();
        getAssetsList();
        Get.back();
      } else {
        final error = handleError(res.error);
        await errorDialog(error);
      }
    } catch (e) {
      final error = handleError(e);
      await errorDialog(error);
    } finally {
      isLoading = false;
      update();
    }
  }

  void assetListResetPage() {
    _assetListSkip = 0;
    isAllLoadedAssetsList = false;
    assetList.clear();
    update();
  }

  Future<List<Assets>> getAssetsList() async {
    if (isListLoading || isAllLoadedAssetsList) return assetList;
    isListLoading = true;
    update();
    try {
      final res =
          await AppRepository().getAssetList(_assetListSkip, _assetListLimit);
      if (res.success == true && res.result != null) {
        assetList.addAll(res.result?.items ?? []);
        isAllLoadedAssetsList = assetList.length == res.result?.totalCount;
        _assetListSkip += _assetListLimit;
      } else {
        final error = handleError(res.error);
        await errorDialog(error);
      }
    } catch (e) {
      final error = handleError(e);
      await errorDialog(error);
    } finally {
      isListLoading = false;
      update();
    }
    return assetList;
  }

  Future<List<Assets>> getAssetsListByPageNo(int page) async {
    try {
      final res = await AppRepository()
          .getAssetList((page - 1) * _assetListLimit, _assetListLimit);
      if (res.success == true && res.result != null) {
        return res.result?.items ?? [];
      } else {
        final error = handleError(res.error);
        await errorDialog(error);
      }
    } catch (e) {
      final error = handleError(e);
      await errorDialog(error);
    } finally {
      isListLoading = false;
      update();
    }
    return [];
  }

  void deleteAsset(int id) async {
    disableId = id;
    update();
    try {
      final res = await AppRepository().deleteAsset(IdRequest(id: id));
      if (res.success == true) {
        Fluttertoast.showToast(msg: 'Asset deleted successfully');
        assetList.removeWhere((element) => element.id == id);
      } else {
        final error = handleError(res.error);
        await errorDialog(error);
      }
    } catch (e) {
      final error = handleError(e);
      await errorDialog(error);
    } finally {
      disableId = null;
      update();
    }
  }

  Future getAllAssetsType() async {
    if (isAssetsTypeLoading || isAllLoaded) return;
    isAssetsTypeLoading = true;
    update();
    try {
      final res = await AppRepository().getAllAssetsType(limit, skip);
      if (res.success == true && res.result != null) {
        assetsTypeList.addAll(res.result?.items ?? []);
        skip += limit;
        isAllLoaded = assetsTypeList.length == res.result?.totalCount;
      } else {
        final error = handleError(res.error);
        await errorDialog(error);
      }
    } catch (e) {
      final error = handleError(e);
      await errorDialog(error);
    } finally {
      isAssetsTypeLoading = false;
      update();
    }
  }

  Future<AssetType?> getAssetsType(int id) async {
    try {
      final res = await AppRepository().getAssetsType(id);
      if (res.success == true && res.result != null) {
        return res.result;
      } else {
        final error = handleError(res.error);
        await errorDialog(error);
      }
    } catch (e) {
      final error = handleError(e);
      await errorDialog(error);
    }
    return null;
  }
}
