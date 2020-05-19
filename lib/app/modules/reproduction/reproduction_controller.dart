import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:mobx/mobx.dart';

part 'reproduction_controller.g.dart';

class ReproductionController = _ReproductionControllerBase
    with _$ReproductionController;

abstract class _ReproductionControllerBase with Store {
  final AudioPlayer _audioPlayer;

  _ReproductionControllerBase(this._audioPlayer);

  @observable
  Duration timeToMusic = Duration();
  @observable
  Duration audioDuration = Duration();
  @observable
  int faixa = 0;

  @computed
  String get progressPositon => timeToMusic != null
      ? ('${timeToMusic.inMinutes.remainder(60)}:' +
          '${timeToMusic.inSeconds.remainder(60)}')
      : '';

  @computed
  double get progressBar => (audioDuration.inSeconds > 0
      ? timeToMusic.inSeconds / audioDuration.inSeconds
      : 0);

  @computed
  String get totalTimeSong => audioDuration != null
      ? '${audioDuration.inMinutes.remainder(60)}:' +
          '${audioDuration.inSeconds.remainder(60)}'
      : '';

  @action
  controllerProgressMusic(double value) {
    int progress = (value * audioDuration.inSeconds).toInt();
    _audioPlayer.seek(Duration(seconds: progress));
  }

  nextSong({List<SongInfo> listSong, Function play}) async {
    faixa++;
    await _audioPlayer.stop();
    if (listSong.length > faixa) {
      play(listSong[faixa].filePath);
    } else {
      faixa = 0;
      play(listSong[faixa].filePath);
    }
  }
}
