import 'common_modal.dart';

class SignUpResponse {
  Result? result;
  String? targetUrl;
  bool? success;
  Error? error;
  bool? unAuthorizedRequest;
  bool? bAbp;

  SignUpResponse(
      {this.result,
      this.targetUrl,
      this.success,
      this.error,
      this.unAuthorizedRequest,
      this.bAbp});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    targetUrl = json['targetUrl'];
    success = json['success'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    unAuthorizedRequest = json['unAuthorizedRequest'];
    bAbp = json['__abp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['targetUrl'] = targetUrl;
    data['success'] = success;
    if (error != null) {
      data['error'] = error!.toJson();
    }
    data['unAuthorizedRequest'] = unAuthorizedRequest;
    data['__abp'] = bAbp;
    return data;
  }
}

class Result {
  String? userName;
  String? name;
  String? surname;
  String? emailAddress;
  bool? isActive;
  String? fullName;
  String? lastLoginTime;
  String? creationTime;
  List<String>? roleNames;
  String? customerCompanyName;
  String? customerSiteName;
  String? customerSPOCName;
  String? customerMobile;
  String? customerMailId;
  String? customerAlternateNo;
  String? customerPONo;
  String? customerAddress;
  String? customerCity;
  String? customerState;
  int? id;

  Result(
      {this.userName,
      this.name,
      this.surname,
      this.emailAddress,
      this.isActive,
      this.fullName,
      this.lastLoginTime,
      this.creationTime,
      this.roleNames,
      this.customerCompanyName,
      this.customerSiteName,
      this.customerSPOCName,
      this.customerMobile,
      this.customerMailId,
      this.customerAlternateNo,
      this.customerPONo,
      this.customerAddress,
      this.customerCity,
      this.customerState,
      this.id});

  Result.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    name = json['name'];
    surname = json['surname'];
    emailAddress = json['emailAddress'];
    isActive = json['isActive'];
    fullName = json['fullName'];
    lastLoginTime = json['lastLoginTime'];
    creationTime = json['creationTime'];
    roleNames = json['roleNames'].cast<String>();
    customerCompanyName = json['customerCompanyName'];
    customerSiteName = json['customerSiteName'];
    customerSPOCName = json['customerSPOCName'];
    customerMobile = json['customerMobile'];
    customerMailId = json['customerMailId'];
    customerAlternateNo = json['customerAlternateNo'];
    customerPONo = json['customerPONo'];
    customerAddress = json['customerAddress'];
    customerCity = json['customerCity'];
    customerState = json['customerState'];

    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['name'] = name;
    data['surname'] = surname;
    data['emailAddress'] = emailAddress;
    data['isActive'] = isActive;
    data['fullName'] = fullName;
    data['lastLoginTime'] = lastLoginTime;
    data['creationTime'] = creationTime;
    data['roleNames'] = roleNames;
    data['customerCompanyName'] = customerCompanyName;
    data['customerSiteName'] = customerSiteName;
    data['customerSPOCName'] = customerSPOCName;
    data['customerMobile'] = customerMobile;
    data['customerMailId'] = customerMailId;
    data['customerAlternateNo'] = customerAlternateNo;
    data['customerPONo'] = customerPONo;
    data['customerAddress'] = customerAddress;
    data['customerCity'] = customerCity;
    data['customerState'] = customerState;
    data['id'] = id;
    return data;
  }
}
