import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kkk/admin_cubit/viewAttendence_cubit/view_attendence_state.dart';
import 'package:kkk/api/api.dart';
import 'package:kkk/models/all_present.dart';

class ViewAttendenceCubit extends Cubit<ViewAttendenceState> {
  ViewAttendenceCubit(this.api) : super(ViewAttendenceInitial());

  final Api api;

  Future<void> viewAttendence({required String meetingName}) async {
    emit(ViewAttendenceLoading());

    try {
      // Ensure the API call is made with correct parameters
      Response response = await api.ViewAttendence(
        endpoint: '/admins/all-present',
        meetingname: meetingName,
      );

      // Check if the response is successful
      if (response.statusCode == 200) {
        // Deserialize JSON response into your AllPresent model
        AllPresent allPresent = AllPresent.fromJson(response.data);
        
        // Emit success state with valid data
        emit(ViewAttendenceSuccess(allPresent));
      } else {
        // Handle unexpected status codes
        emit(ViewAttendenceError('Error: ${response.statusCode} - ${response.statusMessage}'));
      }
    } on DioException catch (e) {
      // Handle Dio exceptions
      String errorMessage = _handleDioError(e);
      emit(ViewAttendenceError(errorMessage));
    } catch (e) {
      // Handle any other unexpected errors
      emit(ViewAttendenceError('Unexpected Error: ${e.toString()}'));
    }
  }

  // Function to handle Dio exceptions more gracefully
  String _handleDioError(DioException e) {
    if (e.response != null) {
      return 'Server Error: ${e.response?.statusCode} - ${e.response?.statusMessage}';
    } else if (e.type == DioExceptionType.connectionTimeout) {
      return 'Connection Timeout Error';
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return 'Receive Timeout Error';
    } else if (e.type == DioExceptionType.sendTimeout) {
      return 'Send Timeout Error';
    } else if (e.type == DioExceptionType.cancel) {
      return 'Request Cancelled';
    } else {
      return 'Unknown Error: ${e.message}';
    }
  }
}