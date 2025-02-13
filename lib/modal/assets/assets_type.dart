import 'package:mechtronz/modal/api_response.dart';

class AssetTypeResult {
  List<AssetType>? items;
  int? totalCount;

  AssetTypeResult({this.items, this.totalCount});

  AssetTypeResult.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <AssetType>[];
      json['items'].forEach((v) {
        items!.add(AssetType.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = totalCount;
    return data;
  }
}

class AssetType {
  int? id;
  String? assetTypeName;
  String? assetTypeDescription;
  String? assetTypeImage;

  AssetType(
      {this.id,
      this.assetTypeName,
      this.assetTypeDescription,
      this.assetTypeImage});

  AssetType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assetTypeName = json['assetTypeName'];
    assetTypeDescription = json['assetTypeDescription'];
    assetTypeImage = json['assetTypeImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['assetTypeName'] = assetTypeName;
    data['assetTypeDescription'] = assetTypeDescription;
    data['assetTypeImage'] = assetTypeImage;
    return data;
  }
}

typedef AllAssetTypeResponse = ApiResponse<AssetTypeResult>;
typedef AssetTypeResponse = ApiResponse<AssetType>;
