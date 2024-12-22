import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kkk/api/api.dart';
import 'package:kkk/models/user_login/user_login.dart';
import 'package:kkk/user_cubit/auth_cubit/user_auth_state.dart';

class UserAuthCubit extends Cubit<UserAuthState> {
  UserAuthCubit(this.api) : super(UserAuthInitial());
  final Api api;
  Userlog({
    required String userName,
    required String userId,
    required String gender,
  }) async {
    emit(UserAuthLoadingInitial());

    try {
      Response response = await api.LogUser(
        endpoint: '/users/login-as-user',
        username: userName,
        ID: userId,
        gender: gender,
      );
      UserLogin userLogin = UserLogin.fromJson(response.data);
      print(userLogin.token);
      emit(UserAuthSuccessInitial(userLogin));
    } on DioException catch (e) {
      emit(UserAuthErrorInitial(e.toString()));
    }
  }
}
