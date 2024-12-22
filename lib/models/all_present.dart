class AllPresent {
  String? status;
  String? message;
  int? userCount;
  List<String>? presentUser;

  AllPresent({this.status, this.message, this.userCount, this.presentUser});

  factory AllPresent.fromJson(Map<String, dynamic> json) {
    // Ensure presentUser is properly converted to a List<String>
    var presentUserFromJson = json['presentUser'] as List<dynamic>?; // Dynamically decode first
    List<String>? presentUser = presentUserFromJson?.map((user) => user.toString()).toList();

    return AllPresent(
      status: json['status'] as String?,
      message: json['message'] as String?,
      userCount: json['userCount'] as int?,
      presentUser: presentUser,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'userCount': userCount,
        'presentUser': presentUser,
      };
}