// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AudioStore on _AudioStoreBase, Store {
  Computed<int> _$getFaixaComputed;

  @override
  int get getFaixa => (_$getFaixaComputed ??=
          Computed<int>(() => super.getFaixa, name: '_AudioStoreBase.getFaixa'))
      .value;

  final _$songModelAtom = Atom(name: '_AudioStoreBase.songModel');

  @override
  SongModel get songModel {
    _$songModelAtom.reportRead();
    return super.songModel;
  }

  @override
  set songModel(SongModel value) {
    _$songModelAtom.reportWrite(value, super.songModel, () {
      super.songModel = value;
    });
  }

  final _$timeToMusicAtom = Atom(name: '_AudioStoreBase.timeToMusic');

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

  final _$playerStateAtom = Atom(name: '_AudioStoreBase.playerState');

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

  final _$audioDurationAtom = Atom(name: '_AudioStoreBase.audioDuration');

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

  final _$_AudioStoreBaseActionController =
      ActionController(name: '_AudioStoreBase');

  @override
  dynamic getSongPlayer(SongModel value) {
    final _$actionInfo = _$_AudioStoreBaseActionController.startAction(
        name: '_AudioStoreBase.getSongPlayer');
    try {
      return super.getSongPlayer(value);
    } finally {
      _$_AudioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPositionToMusic() {
    final _$actionInfo = _$_AudioStoreBaseActionController.startAction(
        name: '_AudioStoreBase.getPositionToMusic');
    try {
      return super.getPositionToMusic();
    } finally {
      _$_AudioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPlayerState() {
    final _$actionInfo = _$_AudioStoreBaseActionController.startAction(
        name: '_AudioStoreBase.getPlayerState');
    try {
      return super.getPlayerState();
    } finally {
      _$_AudioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getTotalDuration() {
    final _$actionInfo = _$_AudioStoreBaseActionController.startAction(
        name: '_AudioStoreBase.getTotalDuration');
    try {
      return super.getTotalDuration();
    } finally {
      _$_AudioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
songModel: ${songModel},
timeToMusic: ${timeToMusic},
playerState: ${playerState},
audioDuration: ${audioDuration},
getFaixa: ${getFaixa}
    ''';
  }
}
