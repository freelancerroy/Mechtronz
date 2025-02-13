import 'package:mechtronz/modal/api_response.dart';

class CreateAssetsResult {
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

  CreateAssetsResult(
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

  CreateAssetsResult.fromJson(Map<String, dynamic> json) {
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

typedef CreateAssetsResponse = ApiResponse<CreateAssetsResult>;
