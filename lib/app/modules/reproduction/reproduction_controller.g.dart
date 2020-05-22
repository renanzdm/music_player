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

  final _$_ReproductionControllerBaseActionController =
      ActionController(name: '_ReproductionControllerBase');

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
audioDuration: ${audioDuration},
faixa: ${faixa},
progressPositon: ${progressPositon},
progressBar: ${progressBar},
totalTimeSong: ${totalTimeSong}
    ''';
  }
}
