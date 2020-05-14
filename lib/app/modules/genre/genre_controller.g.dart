// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GenreController on _GenreControllerBase, Store {
  final _$valueAtom = Atom(name: '_GenreControllerBase.value');

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

  final _$_GenreControllerBaseActionController =
      ActionController(name: '_GenreControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_GenreControllerBaseActionController.startAction(
        name: '_GenreControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_GenreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
