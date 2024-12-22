import 'package:kkk/models/user_login/user_login.dart';

class UserAuthState {}

final class UserAuthInitial extends UserAuthState {}

final class UserAuthSuccessInitial extends UserAuthState {
  final UserLogin userLogin;
  UserAuthSuccessInitial(this.userLogin);
}

final class UserAuthLoadingInitial extends UserAuthState {}

final class UserAuthErrorInitial extends UserAuthState {
  final String errorMessage;
  UserAuthErrorInitial(this.errorMessage);
}
