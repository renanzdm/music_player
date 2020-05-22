import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:mobx/mobx.dart';

part 'reproduction_controller.g.dart';

class ReproductionController = _ReproductionControllerBase
    with _$ReproductionController;

abstract class _ReproductionControllerBase with Store {
  final AudioPlayer _audioPlayer;

  _ReproductionControllerBase(this._audioPlayer) {
    getTotalDuration();
    getPositionToMusic();
  }

  @observable
  Duration timeToMusic = Duration();
  @observable
  Duration audioDuration = Duration();
  @observable
  int faixa = 0;

  @action
  changeFaixa(int indexFaixa) {
    faixa = indexFaixa;
  }

  @action
  getPositionToMusic() {
    _audioPlayer.onAudioPositionChanged.listen((Duration p) {
      timeToMusic = p;
    });
  }

  @action
  getTotalDuration() {
    _audioPlayer.onDurationChanged.listen((event) {
      audioDuration = event;
    });
  }

  @action
  controllerProgressMusic(double value) {
    int progress = (value * audioDuration.inSeconds).toInt();
    _audioPlayer.seek(Duration(seconds: progress));
  }

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

  nextSong({List<SongInfo> listSong}) async {
    faixa++;
    await _audioPlayer.stop();
    if (listSong.length > faixa) {
      await _audioPlayer.play(listSong[faixa].filePath);
    } else {
      faixa = 0;
      await _audioPlayer.play(listSong[faixa].filePath);
    }
  }

  previousSong({List<SongInfo> listSong}) async {
    faixa--;
    await _audioPlayer.stop();
    if (faixa == -1) {
      faixa = 0;
      await _audioPlayer.play(listSong[faixa].filePath);
    } else {
      await _audioPlayer.play(listSong[faixa].filePath);
    }
  }
}
