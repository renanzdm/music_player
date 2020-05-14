import 'package:audioplayers/audioplayers.dart';
import 'package:mobx/mobx.dart';

part 'reproduction_controller.g.dart';

class ReproductionController = _ReproductionControllerBase
    with _$ReproductionController;

abstract class _ReproductionControllerBase with Store {
  final AudioPlayer audioPlayer;

  _ReproductionControllerBase(this.audioPlayer) {
    getPlayerState();
    getPosition();
  }

  @observable
  int result;

  @action
  playSong(String localPath) async {
    await audioPlayer.play(localPath, isLocal: true);
  }

  @observable
  AudioPlayerState playerState = AudioPlayerState.PLAYING;

  @action
  getPlayerState() {
    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState event) {
      playerState = event;
    });
    //print(playerState);
  }

  pauseSong() async {
    await audioPlayer.pause();
  }

  actionSong(String localPath) async {
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
        break;
      default:
    }
  }

  @observable
  double positionSong;

  @action
  getPosition() {
    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      positionSong = p.inSeconds.toDouble();
    });
  }
}
