// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songs_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SongsController on _SongsControllerBase, Store {
  final _$valueAtom = Atom(name: '_SongsControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_SongsControllerBaseActionController =
      ActionController(name: '_SongsControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_SongsControllerBaseActionController.startAction(
        name: '_SongsControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_SongsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
