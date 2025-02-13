class GenarateOtpRequest {
  String? phoneNumber;
  bool? isSingUp;

  GenarateOtpRequest({this.phoneNumber, this.isSingUp = false});

  GenarateOtpRequest.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    isSingUp = json['isSingUp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNumber'] = phoneNumber;
    data['isSingUp'] = isSingUp;
    return data;
  }
}
