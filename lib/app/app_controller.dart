import 'package:audioplayers/audioplayers.dart';
import 'package:mobx/mobx.dart';

import 'shared/model/song_model.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final AudioPlayer _audioPlayer;
  _AppControllerBase(this._audioPlayer) {
    getPositionToMusic();
    getPlayerState();
    getTotalDuration();
  }

  @observable
  SongModel songModel = SongModel();
  @observable
  Duration timeToMusic = Duration();
  @observable
  AudioPlayerState playerState = AudioPlayerState.STOPPED;
  @observable
  Duration audioDuration = Duration();

  @action
  getSongPlayer(SongModel value) {
    songModel = songModel.copyWith(
        indexFaixa: value.indexFaixa,
        listSongPlayer: value.listSongPlayer,
        playerState: value.playerState);
  }

  @computed
  int get getFaixa => songModel.indexFaixa;

  @action
  getPositionToMusic() {
    _audioPlayer.onAudioPositionChanged.listen((Duration p) {
      timeToMusic = p;
    });
  }

  @action
  getPlayerState() {
    _audioPlayer.onPlayerStateChanged.listen((AudioPlayerState event) {
      playerState = event;
    });
  }

  @action
  getTotalDuration() {
    _audioPlayer.onDurationChanged.listen((event) {
      audioDuration = event;
    });
  }

  actionSong(String localPath, AudioPlayerState playerState) async {
    switch (playerState) {
      case AudioPlayerState.PLAYING:
        await _audioPlayer.pause();
        break;
      case AudioPlayerState.PAUSED:
        await _audioPlayer.play(localPath, isLocal: true);
        break;
      case AudioPlayerState.STOPPED:
        await _audioPlayer.play(localPath, isLocal: true);
        break;
      case AudioPlayerState.COMPLETED:
        await _audioPlayer.play(localPath, isLocal: true);

        break;
      default:
    }
  }
}
