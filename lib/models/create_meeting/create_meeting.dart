import 'meeting.dart';

class CreateMeeting {
  String? status;
  String? message;
  List<Meeting>? meeting;

  CreateMeeting({this.status, this.message, this.meeting});

  factory CreateMeeting.fromJson(Map<String, dynamic> json) => CreateMeeting(
        status: json['status'] as String?,
        message: json['message'] as String?,
        meeting: (json['meeting'] as List<dynamic>?)
            ?.map((e) => Meeting.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'meeting': meeting?.map((e) => e.toJson()).toList(),
      };
}
