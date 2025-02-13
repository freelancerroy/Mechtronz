class IdRequest {
  int? id;

  IdRequest({required this.id});

  IdRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
    };
  }
}
