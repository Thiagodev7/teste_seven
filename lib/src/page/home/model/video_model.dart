class VideoModel {
  String? url;

  VideoModel({this.url});

  VideoModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
    };
  }
}