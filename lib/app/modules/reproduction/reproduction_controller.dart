import 'package:audioplayers/audioplayers.dart';
import 'package:mobx/mobx.dart';

part 'reproduction_controller.g.dart';

class ReproductionController = _ReproductionControllerBase
    with _$ReproductionController;

abstract class _ReproductionControllerBase with Store {
  final AudioPlayer audioPlayer;

  _ReproductionControllerBase(this.audioPlayer) {
    getPlayerState();
  }

  @observable
  int result;
  @action
  playSong(String localPath) async {
    await audioPlayer.play(localPath, isLocal: true);
  }

  @observable
  AudioPlayerState playerState = AudioPlayerState.STOPPED;
  @action
  getPlayerState() {
    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState event) {
      playerState = event;
    });
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
      //playSong(localPath);
    }
  }
}
