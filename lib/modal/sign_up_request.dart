class SignUpRequest {
  String? customerMobile;
  String? customerName;
  String? customerCity;
  String? customerCompanyName;
  String? customerSiteName;
  bool? isActive;
  String? customerMailId;
  List<String>? roleNames;
  String? customerState;
  String? customerAddress;
  String? customerSPOCName;
  String? password;
  String? customerAlternateNo;
  String? customerPONo;
  String? customerZIPCode;

  SignUpRequest(
      {this.customerMobile,
      this.customerName,
      this.customerCity,
      this.customerCompanyName,
      this.customerSiteName,
      this.isActive,
      this.customerMailId,
      this.roleNames,
      this.customerState,
      this.customerAddress,
      this.customerSPOCName,
      this.password,
      this.customerAlternateNo,
      this.customerPONo,
      this.customerZIPCode});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    customerMobile = json['CustomerMobile'];
    customerName = json['CustomerName'];
    customerCity = json['CustomerCity'];
    customerCompanyName = json['CustomerCompanyName'];
    customerSiteName = json['CustomerSiteName'];
    isActive = json['IsActive'];
    customerMailId = json['CustomerMailId'];
    roleNames = json['RoleNames']?.cast<String>();
    customerState = json['CustomerState'];
    customerAddress = json['CustomerAddress'];
    customerSPOCName = json['CustomerSPOCName'];
    password = json['Password'];
    customerAlternateNo = json['CustomerAlternateNo'];
    customerPONo = json['CustomerPONo'];
    customerZIPCode = json['ZipCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CustomerMobile'] = customerMobile;
    data['CustomerName'] = customerName;
    data['CustomerCity'] = customerCity;
    data['CustomerCompanyName'] = customerCompanyName;
    data['CustomerSiteName'] = customerSiteName;
    data['IsActive'] = isActive;
    data['CustomerMailId'] = customerMailId;
    data['RoleNames'] = roleNames?.firstOrNull;
    data['CustomerState'] = customerState;
    data['CustomerAddress'] = customerAddress;
    data['CustomerSPOCName'] = customerSPOCName;
    data['Password'] = password;
    data['CustomerAlternateNo'] = customerAlternateNo;
    data['CustomerPONo'] = customerPONo;
    data['ZipCode'] = customerZIPCode;
    return data;
  }
}
