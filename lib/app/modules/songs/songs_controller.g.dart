// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songs_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SongsController on _SongsControllerBase, Store {
  final _$listSongsAtom = Atom(name: '_SongsControllerBase.listSongs');

  @override
  List<SongInfo> get listSongs {
    _$listSongsAtom.reportRead();
    return super.listSongs;
  }

  @override
  set listSongs(List<SongInfo> value) {
    _$listSongsAtom.reportWrite(value, super.listSongs, () {
      super.listSongs = value;
    });
  }

  final _$getDataSongsAsyncAction =
      AsyncAction('_SongsControllerBase.getDataSongs');

  @override
  Future getDataSongs() {
    return _$getDataSongsAsyncAction.run(() => super.getDataSongs());
  }

  @override
  String toString() {
    return '''
listSongs: ${listSongs}
    ''';
  }
}
