class PaginationParam {
  int? maxResultCount;
  int? skipCount;

  PaginationParam({this.maxResultCount, this.skipCount});

  PaginationParam.fromJson(Map<String, dynamic> json) {
    maxResultCount = json['maxResultCount'];
    skipCount = json['skipCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maxResultCount'] = maxResultCount;
    data['skipCount'] = skipCount;
    return data;
  }
}
