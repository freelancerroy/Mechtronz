class ValidateOtpRequest {
  String? phoneNumber;
  String? otp;

  ValidateOtpRequest({this.phoneNumber, this.otp});

  ValidateOtpRequest.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNumber'] = phoneNumber;
    data['otp'] = otp;
    return data;
  }
}
