import 'package:dio/dio.dart';

class CreateAssetsRequest {
  String? assetName;
  MultipartFile? assetImagePath;
  String? machineLocation;
  String? uin;
  double? capacityTonnage;
  String? machineType;
  String? brandName;
  int? assetTypeId;

  CreateAssetsRequest(
      {this.assetName,
      this.assetImagePath,
      this.machineLocation,
      this.uin,
      this.capacityTonnage,
      this.machineType,
      this.brandName,
      this.assetTypeId});

  CreateAssetsRequest.fromJson(Map<String, dynamic> json) {
    assetName = json['AssetName'];
    assetImagePath = json['AssetImagePath'];
    machineLocation = json['MachineLocation'];
    uin = json['UIN'];
    capacityTonnage = json['CapacityTonnage'];
    machineType = json['MachineType'];
    brandName = json['BrandName'];
    assetTypeId = json['AssetTypeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AssetName'] = assetName;
    data['AssetImagePath'] = assetImagePath;
    data['MachineLocation'] = machineLocation;
    data['UIN'] = uin;
    data['CapacityTonnage'] = capacityTonnage;
    data['MachineType'] = machineType;
    data['BrandName'] = brandName;
    data['AssetTypeId'] = assetTypeId;
    return data;
  }
}
