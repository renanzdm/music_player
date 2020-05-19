// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  final _$songInfoPlayerAtom = Atom(name: '_AppControllerBase.songInfoPlayer');

  @override
  SongInfo get songInfoPlayer {
    _$songInfoPlayerAtom.reportRead();
    return super.songInfoPlayer;
  }

  @override
  set songInfoPlayer(SongInfo value) {
    _$songInfoPlayerAtom.reportWrite(value, super.songInfoPlayer, () {
      super.songInfoPlayer = value;
    });
  }

  @override
  String toString() {
    return '''
songInfoPlayer: ${songInfoPlayer}
    ''';
  }
}
