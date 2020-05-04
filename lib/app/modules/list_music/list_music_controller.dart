import 'package:mobx/mobx.dart';
import 'package:musicplayer/app/shared/model/video_model.dart';
import 'package:musicplayer/app/shared/repositories/video_repository.dart';


part 'list_music_controller.g.dart';

class ListMusicController = _ListMusicsControllerBase
    with _$ListMusicController;

abstract class _ListMusicsControllerBase with Store {
  final VideoRepository _videoRepository;

  _ListMusicsControllerBase(this._videoRepository) {
    getVideo();
  }

  @observable
  List<VideoModel> videos;

  @action
  getVideo() async {
    videos = await _videoRepository.fetchVideos();
    print(videos);
  }
}
