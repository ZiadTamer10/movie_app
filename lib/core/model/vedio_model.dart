class VideoModel {
  final String key;
  final String type;
  final String site;

  VideoModel({required this.key, required this.type, required this.site});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      key: json['key'] ?? '',
      type: json['type'] ?? '',
      site: json['site'] ?? '',
    );
  }
}
