class CreatedBy {
  String? id;
  String? username;

  CreatedBy({this.id, this.username});

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
        id: json['_id'] as String?,
        username: json['username'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'username': username,
      };
}
