import 'admin.dart';

class AdminLogin {
  final String? status;
  final String? message;
  final String? token;
  final Admin? admin;

  AdminLogin({this.status, this.message, this.token, this.admin});

  factory AdminLogin.fromJson(json) => AdminLogin(
        status: json['status'] as String?,
        message: json['message'] as String?,
        token: json['token'] as String?,
        admin: json['admin'] == null
            ? null
            : Admin.fromJson(json['admin'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'token': token,
        'admin': admin?.toJson(),
      };
}
