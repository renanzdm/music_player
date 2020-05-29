import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:mobx/mobx.dart';

part 'details_album_controller.g.dart';

class DetailsAlbumController = _DetailsAlbumControllerBase
    with _$DetailsAlbumController;

abstract class _DetailsAlbumControllerBase with Store {
  final FlutterAudioQuery _audioQuery;
  final AudioPlayer audioPlayer;

  _DetailsAlbumControllerBase(this._audioQuery, this.audioPlayer);

  @observable
  List<SongInfo> songs;

  @action
  Future<List<SongInfo>> getSongs(String albumId) async {
    return songs = await _audioQuery.getSongsFromAlbum(albumId: albumId);
  }

  playSongSelected(String filePath) async {
    if (audioPlayer.state == AudioPlayerState.PLAYING) {
      await audioPlayer.stop();
      await audioPlayer.play(filePath);
    } else {
      await audioPlayer.play(filePath);
    }
  }
}
