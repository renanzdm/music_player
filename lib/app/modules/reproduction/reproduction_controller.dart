import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:mobx/mobx.dart';

part 'reproduction_controller.g.dart';

class ReproductionController = _ReproductionControllerBase
    with _$ReproductionController;

abstract class _ReproductionControllerBase with Store {
  final AudioPlayer _audioPlayer;

  _ReproductionControllerBase(this._audioPlayer) {
    getPlayerState();
    getPositionToMusic();
    getTotalDuration();
  }

  @observable
  Duration timeToMusic = Duration();
  @observable
  AudioPlayerState playerState = AudioPlayerState.PLAYING;
  @observable
  Duration audioDuration = Duration();
  @observable
  int faixa = 0;

  @action
  getPlayerState() {
    _audioPlayer.onPlayerStateChanged.listen((AudioPlayerState event) {
      playerState = event;
    });
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
        playSong(localPath);

        break;
      default:
    }
  }

  playSong(String localPath) async {
    await _audioPlayer.play(localPath, isLocal: true);
  }

  pauseSong() async {
    await _audioPlayer.pause();
  }

  nextSong(List<SongInfo> listSong) async {
    faixa++;
    await _audioPlayer.stop();
    if (listSong.length > faixa) {
      print(listSong.length);
      print(faixa);

      playSong(listSong[faixa].filePath);
    } else {
      faixa = 0;
      playSong(listSong[faixa].filePath);
    }
  }
}
