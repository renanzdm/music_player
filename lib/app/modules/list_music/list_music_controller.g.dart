// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_music_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListMusicController on _ListMusicControllerBase, Store {
  final _$currentPageAtom = Atom(name: '_ListMusicControllerBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.context.enforceReadPolicy(_$currentPageAtom);
    _$currentPageAtom.reportObserved();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.context.conditionallyRunInAction(() {
      super.currentPage = value;
      _$currentPageAtom.reportChanged();
    }, _$currentPageAtom, name: '${_$currentPageAtom.name}_set');
  }

  final _$_ListMusicControllerBaseActionController =
      ActionController(name: '_ListMusicControllerBase');

  @override
  dynamic setPage(int value) {
    final _$actionInfo =
        _$_ListMusicControllerBaseActionController.startAction();
    try {
      return super.setPage(value);
    } finally {
      _$_ListMusicControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'currentPage: ${currentPage.toString()}';
    return '{$string}';
  }
}
