import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kkk/admin_cubit/Createmeeting_cubit/create_meeting_cubit.dart';
import 'package:kkk/admin_cubit/adminLogin_cubit/login_admin_cubit.dart';
import 'package:kkk/admin_cubit/viewAttendence_cubit/view_attendence_cubit.dart';
import 'package:kkk/api/api.dart';
import 'package:kkk/api/cache_services.dart';
import 'package:kkk/login.dart';
import 'package:kkk/user_cubit/auth_cubit/user_auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.initSharedPreference();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginAdminCubit(Api(
              Dio(),
            )),
          ),
          BlocProvider(
            create: (context) => UserAuthCubit(Api(
              Dio(),
            )),
          ),
          BlocProvider(
            create: (context) => CreateMeetingCubit(Api(
              Dio(),
            )),
          ),
          BlocProvider(
            create: (context) => ViewAttendenceCubit(Api(
              Dio(),
            )),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Login(),
        ));
  }
}
