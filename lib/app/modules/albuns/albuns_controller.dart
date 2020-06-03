import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:mobx/mobx.dart';
import 'package:musicplayer/app/shared/services/audio_service_interface.dart';

part 'albuns_controller.g.dart';

class AlbunsController = _AlbunsControllerBase with _$AlbunsController;

abstract class _AlbunsControllerBase with Store {
  final IAudioService iAudioService;

  _AlbunsControllerBase(this.iAudioService) {
    getAlbumData();
  }

  @observable
  List<AlbumInfo> listAlbuns;
  @action
  getAlbumData() async {
    listAlbuns = await iAudioService.getAlbuns();
  }
}
