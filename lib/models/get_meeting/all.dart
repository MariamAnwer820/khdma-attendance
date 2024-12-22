import 'created_by.dart';
import 'meeting_qr.dart';

class All {
  String? meetingName;
  String? meetingDate;
  String? meetingTime;
  MeetingQr? meetingQr;
  CreatedBy? createdBy;

  All({
    this.meetingName,
    this.meetingDate,
    this.meetingTime,
    this.meetingQr,
    this.createdBy,
  });

  factory All.fromJson(Map<String, dynamic> json) => All(
        meetingName: json['meetingName'] as String?,
        meetingDate: json['meetingDate'] as String?,
        meetingTime: json['meetingTime'] as String?,
        meetingQr: json['meetingQR'] == null
            ? null
            : MeetingQr.fromJson(json['meetingQR'] as Map<String, dynamic>),
        createdBy: json['createdBy'] == null
            ? null
            : CreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'meetingName': meetingName,
        'meetingDate': meetingDate,
        'meetingTime': meetingTime,
        'meetingQR': meetingQr?.toJson(),
        'createdBy': createdBy?.toJson(),
      };
}
