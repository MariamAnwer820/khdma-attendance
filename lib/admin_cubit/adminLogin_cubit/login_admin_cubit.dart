import 'package:kkk/admin_cubit/adminLogin_cubit/login_admin_state.dart';
import 'package:kkk/api/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kkk/models/AdminLogin/login_admin.dart';

class LoginAdminCubit extends Cubit<LoginAdminState> {
  LoginAdminCubit(this.api) : super(LoginAdminInitial());
  final Api api;

  logAdmin({
    required String usename,
    required String ID,
    required String password,
  }) async {
    emit(LoginAdminloadingState());

    try {
      Response response = await api.LogAdmin(
        endpoint: '/admins/login-as-admin',
        username: usename,
        ID: ID,
        password: password,
      );

      AdminLogin adminLogin = AdminLogin.fromJson(response.data);
      print(adminLogin.status);
      emit(LoginAdminSuccessState(adminLogin));
    } on DioException catch (e) {
      emit(LoginAdminErrorState(e.toString()));
    }
  }

  adduser({
    required String username,
    required String userId,
    required String gender,
  }) async {
    emit(AdduserloadingState());

    try {
      // ignore: unused_local_variable
      Response response = await api.Adduser(
          endpoint: '/admins/add-user',
          username: username,
          ID: userId,
          gender: gender);
      // StudentModel studentModel = StudentModel.fromJson(response.data);
      emit(AdduserSuccessState());
    } on DioException catch (e) {
      emit(AdduserErrorState(e.toString()));
    }
  }
}
