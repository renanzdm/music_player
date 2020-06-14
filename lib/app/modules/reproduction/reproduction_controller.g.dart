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

  final _$faixaAtom = Atom(name: '_ReproductionControllerBase.faixa');

  @override
  int get faixa {
    _$faixaAtom.reportRead();
    return super.faixa;
  }

  @override
  set faixa(int value) {
    _$faixaAtom.reportWrite(value, super.faixa, () {
      super.faixa = value;
    });
  }

  final _$tweenAtom = Atom(name: '_ReproductionControllerBase.tween');

  @override
  VibesTween get tween {
    _$tweenAtom.reportRead();
    return super.tween;
  }

  @override
  set tween(VibesTween value) {
    _$tweenAtom.reportWrite(value, super.tween, () {
      super.tween = value;
    });
  }

  final _$nextSongAsyncAction =
      AsyncAction('_ReproductionControllerBase.nextSong');

  @override
  Future nextSong({List<SongInfo> listSong}) {
    return _$nextSongAsyncAction.run(() => super.nextSong(listSong: listSong));
  }

  final _$previousSongAsyncAction =
      AsyncAction('_ReproductionControllerBase.previousSong');

  @override
  Future previousSong({List<SongInfo> listSong}) {
    return _$previousSongAsyncAction
        .run(() => super.previousSong(listSong: listSong));
  }

  final _$_ReproductionControllerBaseActionController =
      ActionController(name: '_ReproductionControllerBase');

  @override
  dynamic changeTween(AnimationController animation, Size size, Random random) {
    final _$actionInfo = _$_ReproductionControllerBaseActionController
        .startAction(name: '_ReproductionControllerBase.changeTween');
    try {
      return super.changeTween(animation, size, random);
    } finally {
      _$_ReproductionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeFaixa(int indexFaixa) {
    final _$actionInfo = _$_ReproductionControllerBaseActionController
        .startAction(name: '_ReproductionControllerBase.changeFaixa');
    try {
      return super.changeFaixa(indexFaixa);
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
faixa: ${faixa},
tween: ${tween},
progressPositon: ${progressPositon},
progressBar: ${progressBar},
totalTimeSong: ${totalTimeSong}
    ''';
  }
}
