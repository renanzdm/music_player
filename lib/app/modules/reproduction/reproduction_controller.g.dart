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
    _$resultAtom.context.enforceReadPolicy(_$resultAtom);
    _$resultAtom.reportObserved();
    return super.result;
  }

  @override
  set result(int value) {
    _$resultAtom.context.conditionallyRunInAction(() {
      super.result = value;
      _$resultAtom.reportChanged();
    }, _$resultAtom, name: '${_$resultAtom.name}_set');
  }

  final _$playerStateAtom =
      Atom(name: '_ReproductionControllerBase.playerState');

  @override
  AudioPlayerState get playerState {
    _$playerStateAtom.context.enforceReadPolicy(_$playerStateAtom);
    _$playerStateAtom.reportObserved();
    return super.playerState;
  }

  @override
  set playerState(AudioPlayerState value) {
    _$playerStateAtom.context.conditionallyRunInAction(() {
      super.playerState = value;
      _$playerStateAtom.reportChanged();
    }, _$playerStateAtom, name: '${_$playerStateAtom.name}_set');
  }

  final _$playLocalAsyncAction = AsyncAction('playLocal');

  @override
  Future playSong(String localPath) {
    return _$playLocalAsyncAction.run(() => super.playSong(localPath));
  }

  final _$_ReproductionControllerBaseActionController =
      ActionController(name: '_ReproductionControllerBase');

  @override
  dynamic getPlayerState() {
    final _$actionInfo =
        _$_ReproductionControllerBaseActionController.startAction();
    try {
      return super.getPlayerState();
    } finally {
      _$_ReproductionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'result: ${result.toString()},playerState: ${playerState.toString()}';
    return '{$string}';
  }
}
