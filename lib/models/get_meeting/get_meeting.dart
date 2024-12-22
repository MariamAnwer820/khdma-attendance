import 'all.dart';

class GetMeeting {
  String? status;
  String? message;
  int? meetingCounts;
  List<All>? all;

  GetMeeting({this.status, this.message, this.meetingCounts, this.all});

  factory GetMeeting.fromJson(Map<String, dynamic> json) => GetMeeting(
        status: json['status'] as String?,
        message: json['message'] as String?,
        meetingCounts: json['meetingCounts'] as int?,
        all: (json['all'] as List<dynamic>?)
            ?.map((e) => All.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'meetingCounts': meetingCounts,
        'all': all?.map((e) => e.toJson()).toList(),
      };
}
