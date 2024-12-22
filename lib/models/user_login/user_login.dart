import 'user.dart';

class UserLogin {
  String? status;
  String? message;
  String? token;
  User? user;

  UserLogin({this.status, this.message, this.token, this.user});

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        status: json['status'] as String?,
        message: json['message'] as String?,
        token: json['token'] as String?,
        user: json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'token': token,
        'user': user?.toJson(),
      };
}
