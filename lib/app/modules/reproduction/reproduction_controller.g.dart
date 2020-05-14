// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reproduction_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReproductionController on _ReproductionControllerBase, Store {
  final _$resultAtom = Atom(name: '_ReproductionControllerBase.result');

  @override
  int get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(int value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
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

  final _$positionSongAtom =
      Atom(name: '_ReproductionControllerBase.positionSong');

  @override
  double get positionSong {
    _$positionSongAtom.reportRead();
    return super.positionSong;
  }

  @override
  set positionSong(double value) {
    _$positionSongAtom.reportWrite(value, super.positionSong, () {
      super.positionSong = value;
    });
  }

  final _$playSongAsyncAction =
      AsyncAction('_ReproductionControllerBase.playSong');

  @override
  Future playSong(String localPath) {
    return _$playSongAsyncAction.run(() => super.playSong(localPath));
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
  dynamic getPosition() {
    final _$actionInfo = _$_ReproductionControllerBaseActionController
        .startAction(name: '_ReproductionControllerBase.getPosition');
    try {
      return super.getPosition();
    } finally {
      _$_ReproductionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
result: ${result},
playerState: ${playerState},
positionSong: ${positionSong}
    ''';
  }
}
