import 'package:mechtronz/modal/api_response.dart';

class TicketResult {
  int? id;
  int? creatorUserId;
  String? lastModificationTime;
  int? lastModifierUserId;
  bool? isDeleted;
  int? deleterUserId;
  String? deletionTime;
  String? ticketId;
  int? assetId;
  int? customerId;
  String? description;
  String? ticketStatus;
  String? creationTime;
  String? closedAt;
  List<String>? serviceReportImages;
  List<String>? ticketImages;
  String? customerReview;
  int? rating;
  String? customerContactPersonNumber;
  String? technicianReview;

  TicketResult(
      {this.id,
      this.creatorUserId,
      this.lastModificationTime,
      this.lastModifierUserId,
      this.isDeleted,
      this.deleterUserId,
      this.deletionTime,
      this.ticketId,
      this.assetId,
      this.customerId,
      this.description,
      this.ticketStatus,
      this.creationTime,
      this.closedAt,
      this.serviceReportImages,
      this.ticketImages,
      this.customerReview,
      this.rating,
      this.customerContactPersonNumber,
      this.technicianReview});

  TicketResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creatorUserId = json['creatorUserId'];
    lastModificationTime = json['lastModificationTime'];
    lastModifierUserId = json['lastModifierUserId'];
    isDeleted = json['isDeleted'];
    deleterUserId = json['deleterUserId'];
    deletionTime = json['deletionTime'];
    ticketId = json['ticketId'];
    assetId = json['assetId'];
    customerId = json['customerId'];
    description = json['description'];
    ticketStatus = json['ticketStatus'];
    creationTime = json['creationTime'];
    closedAt = json['closedAt'];
    serviceReportImages = json['serviceReportImages'].cast<String>();
    ticketImages = json['ticketImages'].cast<String>();
    customerReview = json['customerReview'];
    rating = json['rating'];
    customerContactPersonNumber = json['customerContactPersonNumber'];
    technicianReview = json['technicianReview'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['creatorUserId'] = creatorUserId;
    data['lastModificationTime'] = lastModificationTime;
    data['lastModifierUserId'] = lastModifierUserId;
    data['isDeleted'] = isDeleted;
    data['deleterUserId'] = deleterUserId;
    data['deletionTime'] = deletionTime;
    data['ticketId'] = ticketId;
    data['assetId'] = assetId;
    data['customerId'] = customerId;
    data['description'] = description;
    data['ticketStatus'] = ticketStatus;
    data['creationTime'] = creationTime;
    data['closedAt'] = closedAt;
    data['serviceReportImages'] = serviceReportImages;
    data['ticketImages'] = ticketImages;
    data['customerReview'] = customerReview;
    data['rating'] = rating;
    data['customerContactPersonNumber'] = customerContactPersonNumber;
    data['technicianReview'] = technicianReview;
    return data;
  }
}

typedef TicketResponse = ApiResponse<TicketResult>;
