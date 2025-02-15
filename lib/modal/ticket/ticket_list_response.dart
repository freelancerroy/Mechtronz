import 'package:mechtronz/modal/api_response.dart';
import 'package:mechtronz/modal/ticket/ticket_response.dart';

class TicketListResult {
  List<TicketResult>? items;
  int? totalCount;

  TicketListResult({this.items, this.totalCount});

  TicketListResult.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <TicketResult>[];
      json['items'].forEach((v) {
        items!.add(TicketResult.fromJson(v));
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

typedef TicketListResponse = ApiResponse<TicketListResult>;
