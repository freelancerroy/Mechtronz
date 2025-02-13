import 'package:mechtronz/modal/api_response.dart';

class AssetResult {
  List<Assets>? items;
  int? totalCount;

  AssetResult({this.items, this.totalCount});

  AssetResult.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Assets>[];
      json['items'].forEach((v) {
        items!.add(Assets.fromJson(v));
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

class Assets {
  int? id;
  String? assetId;
  String? assetName;
  String? assetImagePath;
  int? assetTypeId;
  String? brandName;
  String? machineType;
  double? capacityTonnage;
  String? uin;
  String? machineLocation;
  int? customerId;

  Assets(
      {this.id,
      this.assetId,
      this.assetName,
      this.assetImagePath,
      this.assetTypeId,
      this.brandName,
      this.machineType,
      this.capacityTonnage,
      this.uin,
      this.machineLocation,
      this.customerId});

  Assets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assetId = json['assetId'];
    assetName = json['assetName'];
    assetImagePath = json['assetImagePath'];
    assetTypeId = json['assetTypeId'];
    brandName = json['brandName'];
    machineType = json['machineType'];
    capacityTonnage =
        double.tryParse(json['capacityTonnage']?.toString() ?? '');
    uin = json['uin'];
    machineLocation = json['machineLocation'];
    customerId = json['customerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['assetId'] = assetId;
    data['assetName'] = assetName;
    data['assetImagePath'] = assetImagePath;
    data['assetTypeId'] = assetTypeId;
    data['brandName'] = brandName;
    data['machineType'] = machineType;
    data['capacityTonnage'] = capacityTonnage;
    data['uin'] = uin;
    data['machineLocation'] = machineLocation;
    data['customerId'] = customerId;
    return data;
  }
}

typedef AssetResponse = ApiResponse<AssetResult>;
