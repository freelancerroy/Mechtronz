class SignInRequest {
  String? userNameOrEmailAddress;
  String? password;
  String? phoneNumber;
  String? otp;
  bool? rememberClient;

  SignInRequest(
      {this.userNameOrEmailAddress,
      this.password,
      this.phoneNumber,
      this.otp,
      this.rememberClient});

  SignInRequest.fromJson(Map<String, dynamic> json) {
    userNameOrEmailAddress = json['userNameOrEmailAddress'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    otp = json['otp'];
    rememberClient = json['rememberClient'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userNameOrEmailAddress'] = userNameOrEmailAddress;
    data['password'] = password;
    data['phoneNumber'] = phoneNumber;
    data['otp'] = otp;
    data['rememberClient'] = rememberClient;
    return data;
  }
}
