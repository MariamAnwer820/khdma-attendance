class Photo {
  String? url;
  dynamic publicId;

  Photo({this.url, this.publicId});

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        url: json['url'] as String?,
        publicId: json['publicId'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'url': url,
        'publicId': publicId,
      };
}
