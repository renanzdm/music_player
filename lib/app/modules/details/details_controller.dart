import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:mobx/mobx.dart';

part 'details_controller.g.dart';

class DetailsController = _DetailsControllerBase with _$DetailsController;

abstract class _DetailsControllerBase with Store {
  final FlutterAudioQuery _audioQuery;
  final AudioPlayer audioPlayer;

  _DetailsControllerBase(this._audioQuery, this.audioPlayer);

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
