import 'package:mobx/mobx.dart';
import 'package:musicplayer/app/shared/model/video_model.dart';
import 'package:musicplayer/app/shared/video_repository.dart';

part 'list_music_controller.g.dart';

class ListMusicController = _ListMusicsControllerBase
    with _$ListMusicController;

abstract class _ListMusicsControllerBase with Store {
  final VideoRepository _videoRepository;

  _ListMusicsControllerBase(this._videoRepository) {
    addVideo();
  }

  @observable
  List<VideoModel> videos;

  @action
  addVideo() async {
    videos = await _videoRepository.getVideos();
    print(videos);
  }
}
