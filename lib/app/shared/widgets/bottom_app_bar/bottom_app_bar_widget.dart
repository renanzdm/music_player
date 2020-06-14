import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/app/shared/widgets/bottom_app_bar/bottom_app_bar_controller.dart';
import 'package:musicplayer/app/shared/widgets/button_player/button_player_widget.dart';

class BottomAppBarWidget extends StatefulWidget {
  final double width;

  const BottomAppBarWidget({Key key, this.width}) : super(key: key);

  @override
  _BottomAppBarWidgetState createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState
    extends ModularState<BottomAppBarWidget, BottomAppBarController> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.audioStore.songModel.listSongPlayer != null) {
        int index = controller.audioStore.getFaixa;
        List<SongInfo> listSongs =
            controller.audioStore.songModel.listSongPlayer;
        var songInReproduction = controller.audioStore.songModel
            .listSongPlayer[controller.audioStore.getFaixa];
        return GestureDetector(
          onTap: () {
            Modular.to.pushNamed('reproduction/$index', arguments: listSongs);
          },
          child: Container(
            margin: EdgeInsets.only(left: 4, right: 4),
            padding: EdgeInsets.only(left: 8, right: 8),
            height: 55,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.orange.shade200,
                    backgroundImage: (songInReproduction.albumArtwork != null)
                        ? FileImage(File(songInReproduction.albumArtwork))
                        : AssetImage(
                            'assets/note.png',
                          ),
                    maxRadius: 25,
                    minRadius: 25,
                  ),
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: songInReproduction.displayName,
                      style: GoogleFonts.bebasNeue(
                          fontSize: 14, color: Colors.white),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n${songInReproduction.artist}',
                          style: GoogleFonts.bebasNeue(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.audioStore.actionSong(
                        songInReproduction.filePath,
                        controller.audioStore.playerState);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    child: controller.audioStore.playerState ==
                            AudioPlayerState.PAUSED
                        ? Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.pause,
                            color: Colors.white,
                          ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.orange.shade200),
                  ),
                )
              ],
            ),
          ),
        );
      } else {
        return Container(
          height: 0,
        );
      }
    });
  }
}
