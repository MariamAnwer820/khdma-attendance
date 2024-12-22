import 'package:kkk/models/AdminLogin/login_admin.dart';

class LoginAdminState {}

class LoginAdminInitial extends LoginAdminState {}

class LoginAdminloadingState extends LoginAdminState {}

class LoginAdminSuccessState extends LoginAdminState {
  final AdminLogin adminLogin;
  LoginAdminSuccessState(this.adminLogin);
}

class LoginAdminErrorState extends LoginAdminState {
  final String ErrorMessage;
  LoginAdminErrorState(this.ErrorMessage);
}

class AdduserloadingState extends LoginAdminState {}

class AdduserSuccessState extends LoginAdminState {}

class AdduserErrorState extends LoginAdminState {
  final String ErrorMessage;
  AdduserErrorState(this.ErrorMessage);
}
