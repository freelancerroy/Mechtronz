import 'common_modal.dart';

class ApiResponse<T> {
  T? result;
  String? targetUrl;
  bool? success;
  Error? error;
  bool? unAuthorizedRequest;
  bool? bAbp;

  ApiResponse(
      {this.result,
      this.targetUrl,
      this.success,
      this.error,
      this.unAuthorizedRequest,
      this.bAbp});

  ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    result = json['result'] != null ? fromJsonT(json['result']) : null;
    targetUrl = json['targetUrl'];
    success = json['success'];
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
    unAuthorizedRequest = json['unAuthorizedRequest'];
    bAbp = json['__abp'];
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = toJsonT(result as T);
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
