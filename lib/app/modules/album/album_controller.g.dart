// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AlbumController on _AlbumControllerBase, Store {
  final _$listAlbunsAtom = Atom(name: '_AlbumControllerBase.listAlbuns');

  @override
  List<AlbumInfo> get listAlbuns {
    _$listAlbunsAtom.context.enforceReadPolicy(_$listAlbunsAtom);
    _$listAlbunsAtom.reportObserved();
    return super.listAlbuns;
  }

  @override
  set listAlbuns(List<AlbumInfo> value) {
    _$listAlbunsAtom.context.conditionallyRunInAction(() {
      super.listAlbuns = value;
      _$listAlbunsAtom.reportChanged();
    }, _$listAlbunsAtom, name: '${_$listAlbunsAtom.name}_set');
  }

  final _$getAlbumDataAsyncAction = AsyncAction('getAlbumData');

  @override
  Future getAlbumData() {
    return _$getAlbumDataAsyncAction.run(() => super.getAlbumData());
  }

  @override
  String toString() {
    final string = 'listAlbuns: ${listAlbuns.toString()}';
    return '{$string}';
  }
}
