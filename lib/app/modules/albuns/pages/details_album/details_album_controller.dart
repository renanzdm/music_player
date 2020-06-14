import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:mobx/mobx.dart';
import 'package:musicplayer/app/shared/stores/audio_store.dart';

part 'details_album_controller.g.dart';

class DetailsAlbumController = _DetailsAlbumControllerBase
    with _$DetailsAlbumController;

abstract class _DetailsAlbumControllerBase with Store {
  final FlutterAudioQuery _audioQuery;
  final AudioStore audioStore;
  _DetailsAlbumControllerBase(this._audioQuery, this.audioStore);

  @observable
  List<SongInfo> songs;

  @action
  Future<List<SongInfo>> getSongs(String albumId) async {
    return songs = await _audioQuery.getSongsFromAlbum(albumId: albumId);
  }
}
