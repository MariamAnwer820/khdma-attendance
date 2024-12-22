import 'package:kkk/models/get_meeting/get_meeting.dart';
import 'package:kkk/models/get_meeting/meeting_qr.dart';

class CreateMeetingState {}

final class CreateMeetingInitial extends CreateMeetingState {}

final class CreateMeetingLoading extends CreateMeetingState {}

final class CreateMeetingSuccess extends CreateMeetingState {
  MeetingQr createMeeting;
  CreateMeetingSuccess(this.createMeeting);
}

final class CreateMeetingError extends CreateMeetingState {
  final String errorMessage;
  CreateMeetingError(this.errorMessage);
}

final class GetMeetingLoading extends CreateMeetingState {}

final class GetMeetingSuccess extends CreateMeetingState {
  final GetMeeting getMeeting;
  GetMeetingSuccess(this.getMeeting);
}

final class GetMeetingError extends CreateMeetingState {
  final String errorMessage;
  GetMeetingError(this.errorMessage);
}
