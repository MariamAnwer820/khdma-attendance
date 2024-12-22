import 'package:dio/dio.dart';
import 'package:kkk/cons.dart';

class Api {
  final Dio dio;
  Api(this.dio);
  final String url = 'https://elkhedma.onrender.com';

  //////admin///////
  Future<Response> LogAdmin({
    required String endpoint,
    required String username,
    required String ID,
    required String password,
  }) async {
    try {
      Response response = await dio.post('$url$endpoint', data: {
        'username': username,
        'ID': ID,
        'password': password,
      });
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  Future<Response> Adduser({
    required String endpoint,
    required String username,
    required String ID,
    required String gender,
  }) async {
    try {
      Response response = await dio.post('$url$endpoint', data: {
        'username': username,
        'ID': ID,
        'gender': gender,
      });
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  Future<Response> CreateMeeting({
    required String endpoint,
    required String meetingname,
    required String Time,
    required String Date,
  }) async {
    try {
      Response response = await dio.post('$url$endpoint',
          options: Options(
            headers: {
              'token': token,
            },
          ),
          data: {
            'meetingName': meetingname,
            'meetingTime': Time,
            'meetingDate': Date,
          });
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }

  Future<Response> GetMeeting({
    required String endpoint,
  }) async {
    try {
      Response response = await dio.get(
        '$url$endpoint',
        options: Options(
          headers: {
            'token': token,
          },
        ),
      );
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }




  
   Future<Response>ViewAttendence({
      required String endpoint,
      required String meetingname,
   })async{
    try{
      Response response = await dio.get(
        '$url$endpoint',
        options: Options(
           headers: {
            'token': token,
          },
        ),
        data: {
          'meetingName':meetingname,
        }
      );
      return response;

    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
   }
  //////////user////

  Future<Response> LogUser({
    required String endpoint,
    required String username,
    required String ID,
    required String gender,
  }) async {
    try {
      Response response = await dio.post('$url$endpoint', data: {
        'username': username,
        'ID': ID,
        'gender': gender,
      });
      return response;
    } on DioException catch (e) {
      print(e);
      throw Exception(e.toString());
    } on Exception catch (e) {
      print(e);
      throw Exception(e.toString());
    }
  }
}
