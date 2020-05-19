import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class SongModel{
SongInfo songPlayer;
List<SongInfo> listSongPlayer;
AudioPlayerState playerState;

SongModel({this.songPlayer,this.listSongPlayer,this.playerState});
}