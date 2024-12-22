import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kkk/admin_cubit/Createmeeting_cubit/create_meeting_state.dart';
import 'package:kkk/api/api.dart';
import 'package:kkk/models/get_meeting/get_meeting.dart';
import 'package:kkk/models/get_meeting/meeting_qr.dart';

class CreateMeetingCubit extends Cubit<CreateMeetingState> {
  CreateMeetingCubit(this.api) : super(CreateMeetingInitial());
  final Api api;

  createMeeting({
    required String meetingname,
    required String meetingtime,
    required String meetingdate,
  }) async {
    emit(CreateMeetingLoading());

    try {
      print("Sending data to API...");
      Response response = await api.CreateMeeting(
        endpoint: '/admins/meetings/create-meeting',
        meetingname: meetingname,
        Time: meetingtime,
        Date: meetingdate,
      );
      print(
          "Meeting creation response: ${response.data}"); 
          // Debugging statement
          MeetingQr createMeeting =MeetingQr.fromJson(response.data);
      emit(CreateMeetingSuccess(createMeeting));
    } on DioException catch (e) {
      print(
          "Dio Error on createMeeting: ${e.toString()}"); // Debugging statement
      emit(CreateMeetingError(e.toString()));
    } catch (e) {
      print("Unexpected error in createMeeting: $e"); // Catch unexpected errors
      emit(CreateMeetingError("An unexpected error occurred."));
    }
  }

  getMeeting() async {
    emit(GetMeetingLoading());

    try {
      Response response = await api.GetMeeting(
        endpoint: '/admins/meetings/all-meetings',
      );
      print(
          "GetMeeting response data: ${response.data}"); // Debugging statement
      GetMeeting getMeeting = GetMeeting.fromJson(response.data);
      emit(GetMeetingSuccess(getMeeting));
    } on DioException catch (e) {
      print("Dio Error on getMeeting: ${e.toString()}"); // Debugging statement
      emit(GetMeetingError(e.toString()));
    } catch (e) {
      print("Error in getMeeting: ${e}"); // Catch all errors
      emit(GetMeetingError("An unexpected error occurred."));
    }
  }
}
