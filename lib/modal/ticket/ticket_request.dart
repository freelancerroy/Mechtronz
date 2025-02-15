import 'package:dio/dio.dart';

class TicketRequest {
  int? assetId;
  String? description;
  String? customerContactPersonNumber;
  List<MultipartFile>? ticketImages;

  TicketRequest(
      {this.assetId,
      this.description,
      this.customerContactPersonNumber,
      this.ticketImages});

  TicketRequest.fromJson(Map<String, dynamic> json) {
    assetId = json['AssetId'];
    description = json['Description'];
    customerContactPersonNumber = json['CustomerContactPersonNumber'];
    ticketImages = json['TicketImages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AssetId'] = assetId;
    data['Description'] = description;
    data['CustomerContactPersonNumber'] = customerContactPersonNumber;
    data['TicketImages'] = ticketImages;
    return data;
  }
}
