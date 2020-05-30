import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:mobx/mobx.dart';

part 'details_artist_controller.g.dart';

class DetailsArtistController = _DetailsArtistControllerBase
    with _$DetailsArtistController;

abstract class _DetailsArtistControllerBase with Store {
  final FlutterAudioQuery _audioQuery;
  final AudioPlayer audioPlayer;

  _DetailsArtistControllerBase(this._audioQuery, this.audioPlayer);

  @observable
  List<SongInfo> songs;

  @action
  Future<List<SongInfo>> getSongs(String artistName) async {
    return songs = await _audioQuery.getSongsFromArtist(artist: artistName);
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
