// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsController on _DetailsControllerBase, Store {
  final _$songsAtom = Atom(name: '_DetailsControllerBase.songs');

  @override
  List<SongInfo> get songs {
    _$songsAtom.reportRead();
    return super.songs;
  }

  @override
  set songs(List<SongInfo> value) {
    _$songsAtom.reportWrite(value, super.songs, () {
      super.songs = value;
    });
  }

  final _$getSongsAsyncAction = AsyncAction('_DetailsControllerBase.getSongs');

  @override
  Future getSongs(String albumId) {
    return _$getSongsAsyncAction.run(() => super.getSongs(albumId));
  }

  @override
  String toString() {
    return '''
songs: ${songs}
    ''';
  }
}
