// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AlbumController on _AlbumControllerBase, Store {
  final _$currentPageAtom = Atom(name: '_AlbumControllerBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$listAlbunsAtom = Atom(name: '_AlbumControllerBase.listAlbuns');

  @override
  List<AlbumInfo> get listAlbuns {
    _$listAlbunsAtom.reportRead();
    return super.listAlbuns;
  }

  @override
  set listAlbuns(List<AlbumInfo> value) {
    _$listAlbunsAtom.reportWrite(value, super.listAlbuns, () {
      super.listAlbuns = value;
    });
  }

  final _$getAlbumDataAsyncAction =
      AsyncAction('_AlbumControllerBase.getAlbumData');

  @override
  Future getAlbumData() {
    return _$getAlbumDataAsyncAction.run(() => super.getAlbumData());
  }

  final _$_AlbumControllerBaseActionController =
      ActionController(name: '_AlbumControllerBase');

  @override
  dynamic setPage(int value) {
    final _$actionInfo = _$_AlbumControllerBaseActionController.startAction(
        name: '_AlbumControllerBase.setPage');
    try {
      return super.setPage(value);
    } finally {
      _$_AlbumControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
listAlbuns: ${listAlbuns}
    ''';
  }
}
