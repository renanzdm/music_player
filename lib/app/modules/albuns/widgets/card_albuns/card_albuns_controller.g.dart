// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_albuns_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CardAlbunsController on _CardAlbunsControllerBase, Store {
  final _$valueAtom = Atom(name: '_CardAlbunsControllerBase.value');

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

  final _$_CardAlbunsControllerBaseActionController =
      ActionController(name: '_CardAlbunsControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_CardAlbunsControllerBaseActionController
        .startAction(name: '_CardAlbunsControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CardAlbunsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
