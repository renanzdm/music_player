// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artists_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ArtistsController on _ArtistsControllerBase, Store {
  final _$listArtistsAtom = Atom(name: '_ArtistsControllerBase.listArtists');

  @override
  List<ArtistInfo> get listArtists {
    _$listArtistsAtom.reportRead();
    return super.listArtists;
  }

  @override
  set listArtists(List<ArtistInfo> value) {
    _$listArtistsAtom.reportWrite(value, super.listArtists, () {
      super.listArtists = value;
    });
  }

  final _$getAlbumDataAsyncAction =
      AsyncAction('_ArtistsControllerBase.getAlbumData');

  @override
  Future getAlbumData() {
    return _$getAlbumDataAsyncAction.run(() => super.getAlbumData());
  }

  @override
  String toString() {
    return '''
listArtists: ${listArtists}
    ''';
  }
}
