class MeetingQr {
  String? url;

  MeetingQr({this.url});

  factory MeetingQr.fromJson(Map<String, dynamic> json) => MeetingQr(
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
      };
}
