// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reproduction_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReproductionController on _ReproductionControllerBase, Store {
  Computed<String> _$progressPositonComputed;

  @override
  String get progressPositon => (_$progressPositonComputed ??= Computed<String>(
          () => super.progressPositon,
          name: '_ReproductionControllerBase.progressPositon'))
      .value;
  Computed<double> _$progressBarComputed;

  @override
  double get progressBar =>
      (_$progressBarComputed ??= Computed<double>(() => super.progressBar,
              name: '_ReproductionControllerBase.progressBar'))
          .value;
  Computed<String> _$totalTimeSongComputed;

  @override
  String get totalTimeSong =>
      (_$totalTimeSongComputed ??= Computed<String>(() => super.totalTimeSong,
              name: '_ReproductionControllerBase.totalTimeSong'))
          .value;

  final _$timeToMusicAtom =
      Atom(name: '_ReproductionControllerBase.timeToMusic');

  @override
  Duration get timeToMusic {
    _$timeToMusicAtom.reportRead();
    return super.timeToMusic;
  }

  @override
  set timeToMusic(Duration value) {
    _$timeToMusicAtom.reportWrite(value, super.timeToMusic, () {
      super.timeToMusic = value;
    });
  }

  final _$playerStateAtom =
      Atom(name: '_ReproductionControllerBase.playerState');

  @override
  AudioPlayerState get playerState {
    _$playerStateAtom.reportRead();
    return super.playerState;
  }

  @override
  set playerState(AudioPlayerState value) {
    _$playerStateAtom.reportWrite(value, super.playerState, () {
      super.playerState = value;
    });
  }

  final _$audioDurationAtom =
      Atom(name: '_ReproductionControllerBase.audioDuration');

  @override
  Duration get audioDuration {
    _$audioDurationAtom.reportRead();
    return super.audioDuration;
  }

  @override
  set audioDuration(Duration value) {
    _$audioDurationAtom.reportWrite(value, super.audioDuration, () {
      super.audioDuration = value;
    });
  }

  final _$allSongsAtom = Atom(name: '_ReproductionControllerBase.allSongs');

  @override
  List<SongInfo> get allSongs {
    _$allSongsAtom.reportRead();
    return super.allSongs;
  }

  @override
  set allSongs(List<SongInfo> value) {
    _$allSongsAtom.reportWrite(value, super.allSongs, () {
      super.allSongs = value;
    });
  }

  final _$getAllSongsAleatoryAsyncAction =
      AsyncAction('_ReproductionControllerBase.getAllSongsAleatory');

  @override
  Future<List<SongInfo>> getAllSongsAleatory() {
    return _$getAllSongsAleatoryAsyncAction
        .run(() => super.getAllSongsAleatory());
  }

  final _$_ReproductionControllerBaseActionController =
      ActionController(name: '_ReproductionControllerBase');

  @override
  dynamic getPlayerState() {
    final _$actionInfo = _$_ReproductionControllerBaseActionController
        .startAction(name: '_ReproductionControllerBase.getPlayerState');
    try {
      return super.getPlayerState();
    } finally {
      _$_ReproductionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPositionToMusic() {
    final _$actionInfo = _$_ReproductionControllerBaseActionController
        .startAction(name: '_ReproductionControllerBase.getPositionToMusic');
    try {
      return super.getPositionToMusic();
    } finally {
      _$_ReproductionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getTotalDuration() {
    final _$actionInfo = _$_ReproductionControllerBaseActionController
        .startAction(name: '_ReproductionControllerBase.getTotalDuration');
    try {
      return super.getTotalDuration();
    } finally {
      _$_ReproductionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic controllerProgressMusic(double value) {
    final _$actionInfo =
        _$_ReproductionControllerBaseActionController.startAction(
            name: '_ReproductionControllerBase.controllerProgressMusic');
    try {
      return super.controllerProgressMusic(value);
    } finally {
      _$_ReproductionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
timeToMusic: ${timeToMusic},
playerState: ${playerState},
audioDuration: ${audioDuration},
allSongs: ${allSongs},
progressPositon: ${progressPositon},
progressBar: ${progressBar},
totalTimeSong: ${totalTimeSong}
    ''';
  }
}
