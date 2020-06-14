import 'dart:math';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:mobx/mobx.dart';
import 'package:musicplayer/app/shared/models/song_model.dart';
import 'package:musicplayer/app/shared/models/waves_model.dart';
import 'package:musicplayer/app/shared/stores/audio_store.dart';
import 'package:musicplayer/app/shared/widgets/waves/waves_widget.dart';

part 'reproduction_controller.g.dart';

class ReproductionController = _ReproductionControllerBase
    with _$ReproductionController;

abstract class _ReproductionControllerBase with Store {
  final AudioPlayer _audioPlayer;
  final AudioStore audioStore;

  _ReproductionControllerBase(this._audioPlayer, this.audioStore);

  @observable
  int faixa = 0;
  @observable
  VibesTween tween;

  @action
  changeTween(AnimationController animation, Size size, Random random) {
    tween = VibesTween(
      tween.evaluate(animation),
      new Wave.random(size, random),
    );
    animation.forward(from: 0.0);
  }

  @action
  changeFaixa(int indexFaixa) {
    faixa = indexFaixa;
  }

  @action
  controllerProgressMusic(double value) {
    int progress = (value * audioStore.audioDuration.inSeconds).toInt();
    _audioPlayer.seek(Duration(seconds: progress));
  }

  @computed
  String get progressPositon => audioStore.timeToMusic != null
      ? ('${audioStore.timeToMusic.inMinutes.remainder(60)}:' +
          '${audioStore.timeToMusic.inSeconds.remainder(60)}')
      : '';

  @computed
  double get progressBar => (audioStore.audioDuration.inSeconds > 0
      ? audioStore.timeToMusic.inSeconds / audioStore.audioDuration.inSeconds
      : 0);

  @computed
  String get totalTimeSong => audioStore.audioDuration != null
      ? '${audioStore.audioDuration.inMinutes.remainder(60)}:' +
          '${audioStore.audioDuration.inSeconds.remainder(60)}'
      : '';

  @action
  nextSong({List<SongInfo> listSong}) async {
    await _audioPlayer.stop();
    faixa++;
    if (listSong.length > faixa) {
      await _audioPlayer.play(listSong[faixa]?.filePath);
    } else {
      faixa = 0;
      await _audioPlayer.play(listSong[faixa]?.filePath);
    }
  }

  @action
  previousSong({List<SongInfo> listSong}) async {
    await _audioPlayer.stop();
    faixa--;
    if (faixa <= 0) {
      faixa = 0;
      await _audioPlayer.play(listSong[faixa]?.filePath);
    } else {
      await _audioPlayer.play(listSong[faixa]?.filePath);
    }
  }

  onCompleted({List<SongInfo> listSong, SongModel songModel}) {
    _audioPlayer.onPlayerStateChanged.listen((event) {
      if (event == AudioPlayerState.COMPLETED) {
        nextSong(listSong: listSong);
        audioStore.getSongPlayer(songModel);
      }
    });
  }
}
