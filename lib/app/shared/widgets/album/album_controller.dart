import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:mobx/mobx.dart';
import 'package:musicplayer/app/shared/services/audio_service.dart';

part 'album_controller.g.dart';

class AlbumController = _AlbumControllerBase with _$AlbumController;

abstract class _AlbumControllerBase with Store {
  final AudioService audioService;

  _AlbumControllerBase(this.audioService) {
    getAlbumData();
  }

  @observable
  List<AlbumInfo> listAlbuns = ObservableList<AlbumInfo>();
  @action
  getAlbumData() async {
    listAlbuns = await audioService.getAlbuns();
  }
}
