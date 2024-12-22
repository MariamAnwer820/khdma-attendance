import 'photo.dart';

class User {
  String? id1;
  String? username;
  String? id;
  String? gender;
  Photo? photo;
  List<dynamic>? meeting;
  bool? isAdmin;
  int? v;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id1,
    this.username,
    this.id,
    this.gender,
    this.photo,
    this.meeting,
    this.isAdmin,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id1: json['_id'] as String?,
        username: json['username'] as String?,
        id: json['ID'] as String?,
        gender: json['gender'] as String?,
        photo: json['photo'] == null
            ? null
            : Photo.fromJson(json['photo'] as Map<String, dynamic>),
        meeting: json['meeting'] as List<dynamic>?,
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
        'ID': id,
        'gender': gender,
        'photo': photo?.toJson(),
        'meeting': meeting,
        'isAdmin': isAdmin,
        '__v': v,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
