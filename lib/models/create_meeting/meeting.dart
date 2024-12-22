import 'meeting_qr.dart';

class Meeting {
  String? meetingName;
  String? meetingDate;
  String? meetingTime;
  MeetingQr? meetingQr;
  String? createdBy;
  String? id;
  int? v;
  DateTime? createdAt;
  DateTime? updatedAt;

  Meeting({
    this.meetingName,
    this.meetingDate,
    this.meetingTime,
    this.meetingQr,
    this.createdBy,
    this.id,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  factory Meeting.fromJson(Map<String, dynamic> json) => Meeting(
        meetingName: json['meetingName'] as String?,
        meetingDate: json['meetingDate'] as String?,
        meetingTime: json['meetingTime'] as String?,
        meetingQr: json['meetingQR'] == null
            ? null
            : MeetingQr.fromJson(json['meetingQR'] as Map<String, dynamic>),
        createdBy: json['createdBy'] as String?,
        id: json['_id'] as String?,
        v: json['__v'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'meetingName': meetingName,
        'meetingDate': meetingDate,
        'meetingTime': meetingTime,
        'meetingQR': meetingQr?.toJson(),
        'createdBy': createdBy,
        '_id': id,
        '__v': v,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
