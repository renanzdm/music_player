// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  final _$songModelAtom = Atom(name: '_AppControllerBase.songModel');

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

  final _$timeToMusicAtom = Atom(name: '_AppControllerBase.timeToMusic');

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

  final _$playerStateAtom = Atom(name: '_AppControllerBase.playerState');

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

  final _$audioDurationAtom = Atom(name: '_AppControllerBase.audioDuration');

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

  final _$_AppControllerBaseActionController =
      ActionController(name: '_AppControllerBase');

  @override
  dynamic getSongPlayer(SongModel value) {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.getSongPlayer');
    try {
      return super.getSongPlayer(value);
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPositionToMusic() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.getPositionToMusic');
    try {
      return super.getPositionToMusic();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPlayerState() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.getPlayerState');
    try {
      return super.getPlayerState();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getTotalDuration() {
    final _$actionInfo = _$_AppControllerBaseActionController.startAction(
        name: '_AppControllerBase.getTotalDuration');
    try {
      return super.getTotalDuration();
    } finally {
      _$_AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
songModel: ${songModel},
timeToMusic: ${timeToMusic},
playerState: ${playerState},
audioDuration: ${audioDuration}
    ''';
  }
}
