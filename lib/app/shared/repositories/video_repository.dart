import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/shared/model/video_model.dart';
import 'package:musicplayer/app/shared/utils/colors.dart';

class VideoRepository extends Disposable {
  final Dio client;

  VideoRepository(this.client);

  Future<List<VideoModel>> fetchVideos() async {
    final response = await client.get(
        'https://www.googleapis.com/youtube/v3/videos?part=snippet&chart=mostPopular&key=$APIKEY&maxResults=10');
    return (response.data["items"] as List)
        .map((json) => VideoModel.fromJson(json))
        .toList();
  }

  @override
  void dispose() {}
}
