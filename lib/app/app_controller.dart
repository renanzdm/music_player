import 'package:audioplayers/audioplayers.dart';
import 'package:mobx/mobx.dart';
import 'package:musicplayer/app/shared/model/SongModel.dart';

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
  SongModel songModel;
  @observable
  Duration timeToMusic = Duration();
  @observable
  AudioPlayerState playerState = AudioPlayerState.STOPPED;
  @observable
  Duration audioDuration = Duration();

  @action
  getSongPlayer(SongModel value) {
    songModel = value;
  }

  @action
  getPositionToMusic() {
    _audioPlayer.onAudioPositionChanged.listen((Duration p) {
      timeToMusic = p;
    });
    print(timeToMusic);
  }

  @action
  getPlayerState() {
    _audioPlayer.onPlayerStateChanged.listen((AudioPlayerState event) {
      playerState = event;
    });
    print(playerState);
  }

  @action
  getTotalDuration() {
    _audioPlayer.onDurationChanged.listen((event) {
      audioDuration = event;
    });
    print(audioDuration);
  }

  playSong(String localPath) async {
    await _audioPlayer.play(localPath, isLocal: true);
  }

  pauseSong() {
     _audioPlayer.pause();
  }

  actionSong(String localPath, AudioPlayerState playerState) async {
    switch (playerState) {
      case AudioPlayerState.PLAYING:
        pauseSong();
        break;
      case AudioPlayerState.PAUSED:
        playSong(localPath);
        break;
      case AudioPlayerState.STOPPED:
        playSong(localPath);
        break;
      case AudioPlayerState.COMPLETED:
        playSong(localPath);

        break;
      default:
    }
  }
}
