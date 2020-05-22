import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class SongModel {
  final List<SongInfo> listSongPlayer;
  final AudioPlayerState playerState;
  final int indexFaixa;

  SongModel({this.indexFaixa, this.listSongPlayer, this.playerState});

  copyWith({
    List<SongInfo> listSongPlayer,
    AudioPlayerState playerState,
    int indexFaixa,
  }) {
    return SongModel(
      listSongPlayer: listSongPlayer ?? this.listSongPlayer,
      playerState: playerState ?? this.playerState,
      indexFaixa: indexFaixa ?? this.indexFaixa,
    );
  }
}
