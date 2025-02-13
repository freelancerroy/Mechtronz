import 'package:mechtronz/modal/api_response.dart';
import 'package:mechtronz/modal/assets/asset_response.dart';

class AssetsListResult {
  List<AssetResult>? assets;

  AssetsListResult({this.assets});

  AssetsListResult.fromJson(List<dynamic>? json) {
    if (json != null && json.isNotEmpty) {
      assets = <AssetResult>[];
      for (var v in json) {
        assets!.add(AssetResult.fromJson(v));
      }
    }
  }
}

typedef AssetsListResponse = ApiResponse<AssetsListResult>;
