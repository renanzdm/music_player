// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_artist_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsArtistController on _DetailsArtistControllerBase, Store {
  final _$listSongsFromArtistAtom =
      Atom(name: '_DetailsArtistControllerBase.listSongsFromArtist');

  @override
  List<SongInfo> get listSongsFromArtist {
    _$listSongsFromArtistAtom.reportRead();
    return super.listSongsFromArtist;
  }

  @override
  set listSongsFromArtist(List<SongInfo> value) {
    _$listSongsFromArtistAtom.reportWrite(value, super.listSongsFromArtist, () {
      super.listSongsFromArtist = value;
    });
  }

  final _$getSongsAsyncAction =
      AsyncAction('_DetailsArtistControllerBase.getSongs');

  @override
  Future<List<SongInfo>> getSongs(String artist) {
    return _$getSongsAsyncAction.run(() => super.getSongs(artist));
  }

  @override
  String toString() {
    return '''
listSongsFromArtist: ${listSongsFromArtist}
    ''';
  }
}
