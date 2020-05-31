// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albuns_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AlbunsController on _AlbunsControllerBase, Store {
  final _$listAlbunsAtom = Atom(name: '_AlbunsControllerBase.listAlbuns');

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
      AsyncAction('_AlbunsControllerBase.getAlbumData');

  @override
  Future getAlbumData() {
    return _$getAlbumDataAsyncAction.run(() => super.getAlbumData());
  }

  @override
  String toString() {
    return '''
listAlbuns: ${listAlbuns}
    ''';
  }
}
