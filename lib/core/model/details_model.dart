import 'package:movie_app/core/model/vedio_model.dart';

class DetailsModel {
  final List<VideoModel> videos;

  DetailsModel({required this.videos});

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    final videosJson = json['videos']?['results'] ?? [];

    return DetailsModel(
      videos: List<VideoModel>.from(
        videosJson.map((e) => VideoModel.fromJson(e)),
      ),
    );
  }
}
