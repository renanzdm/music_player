// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_bar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppBarController on _AppBarControllerBase, Store {
  final _$currentIndexAtom = Atom(name: '_AppBarControllerBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$_AppBarControllerBaseActionController =
      ActionController(name: '_AppBarControllerBase');

  @override
  dynamic getPage(int page) {
    final _$actionInfo = _$_AppBarControllerBaseActionController.startAction(
        name: '_AppBarControllerBase.getPage');
    try {
      return super.getPage(page);
    } finally {
      _$_AppBarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
