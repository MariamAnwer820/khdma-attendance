import 'photo.dart';

class Admin {
  String? id1;
  String? username;
  String? password;
  String? id;
  String? gender;
  Photo? photo;
  bool? isAdmin;
  int? v;
  DateTime? createdAt;
  DateTime? updatedAt;

  Admin({
    this.id1,
    this.username,
    this.password,
    this.id,
    this.gender,
    this.photo,
    this.isAdmin,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        id1: json['_id'] as String?,
        username: json['username'] as String?,
        password: json['password'] as String?,
        id: json['ID'] as String?,
        gender: json['gender'] as String?,
        photo: json['photo'] == null
            ? null
            : Photo.fromJson(json['photo'] as Map<String, dynamic>),
        isAdmin: json['isAdmin'] as bool?,
        v: json['__v'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'username': username,
        'password': password,
        'ID': id,
        'gender': gender,
        'photo': photo?.toJson(),
        'isAdmin': isAdmin,
        '__v': v,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
