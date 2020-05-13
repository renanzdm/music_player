import 'package:audioplayers/audioplayers.dart';
import 'package:mobx/mobx.dart';

part 'reproduction_controller.g.dart';

class ReproductionController = _ReproductionControllerBase
    with _$ReproductionController;

abstract class _ReproductionControllerBase with Store {
  final AudioPlayer audioPlayer;

  _ReproductionControllerBase(this.audioPlayer);

  @observable
  int result;
  @action
  playLocal(String localPath) async {
    int result = await audioPlayer.play(localPath, isLocal: true);
    print(result);
  }
  @observable
  AudioPlayerState playerState;
  @action
  getPlayerState(){
    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState event) { 
      playerState = event;
    });
  }

}
