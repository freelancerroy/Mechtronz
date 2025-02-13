import 'package:mechtronz/modal/api_response.dart';

class UserResult {
  Application? application;
  User? user;
  Tenant? tenant;

  UserResult({this.application, this.user, this.tenant});

  UserResult.fromJson(Map<String, dynamic> json) {
    application = json['application'] != null
        ? Application.fromJson(json['application'])
        : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    tenant = json['tenant'] != null ? Tenant.fromJson(json['tenant']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (application != null) {
      data['application'] = application!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (tenant != null) {
      data['tenant'] = tenant!.toJson();
    }
    return data;
  }
}

class Application {
  String? version;
  String? releaseDate;
  Features? features;

  Application({this.version, this.releaseDate, this.features});

  Application.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    releaseDate = json['releaseDate'];
    features =
        json['features'] != null ? Features.fromJson(json['features']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['version'] = version;
    data['releaseDate'] = releaseDate;
    if (features != null) {
      data['features'] = features!.toJson();
    }
    return data;
  }
}

class Features {
  bool? additionalProp1;
  bool? additionalProp2;
  bool? additionalProp3;

  Features({this.additionalProp1, this.additionalProp2, this.additionalProp3});

  Features.fromJson(Map<String, dynamic> json) {
    additionalProp1 = json['additionalProp1'];
    additionalProp2 = json['additionalProp2'];
    additionalProp3 = json['additionalProp3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['additionalProp1'] = additionalProp1;
    data['additionalProp2'] = additionalProp2;
    data['additionalProp3'] = additionalProp3;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? surname;
  String? userName;
  String? emailAddress;

  User({this.id, this.name, this.surname, this.userName, this.emailAddress});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    userName = json['userName'];
    emailAddress = json['emailAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['surname'] = surname;
    data['userName'] = userName;
    data['emailAddress'] = emailAddress;
    return data;
  }
}

class Tenant {
  int? id;
  String? tenancyName;
  String? name;

  Tenant({this.id, this.tenancyName, this.name});

  Tenant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenancyName = json['tenancyName'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tenancyName'] = tenancyName;
    data['name'] = name;
    return data;
  }
}

typedef UserResponse = ApiResponse<UserResult>;
