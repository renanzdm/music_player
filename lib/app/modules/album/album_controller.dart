import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:mobx/mobx.dart';

part 'album_controller.g.dart';

class AlbumController = _AlbumControllerBase with _$AlbumController;

abstract class _AlbumControllerBase with Store {
  final FlutterAudioQuery _audioQuery;

  _AlbumControllerBase(this._audioQuery) {
    getAlbumData();
  }

  @observable
  List<AlbumInfo> listAlbuns;
  @action
  getAlbumData() async {
    listAlbuns = await _audioQuery.getAlbums();
    // listAlbuns.forEach((element) {
    //   print(element.artist);
    // });
  }
}
