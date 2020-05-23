import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/app/app_module.dart';
import 'package:musicplayer/app/shared/widgets/button_player/button_player_widget.dart';

import '../../../app_controller.dart';

class BottomAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppController _appController = AppModule.to.get();

    return Observer(builder: (_) {
      return GestureDetector(
        onTap: _appController.getFaixa != null
            ? () {
                Modular.to.pushNamed('/reproduction/${_appController.getFaixa}',
                    arguments: _appController.songModel.listSongPlayer);
              }
            : null,
        child: Container(
          height: 50,
          margin: EdgeInsets.only(left: 8, right: 8, bottom: 10),
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Theme.of(context).disabledColor,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text.rich(
                    TextSpan(
                      text: _appController.songModel.indexFaixa != null
                          ? _appController
                              .songModel
                              .listSongPlayer[_appController.getFaixa]
                              .displayName
                          : 'Nada Reproduzindo',
                      style: GoogleFonts.roboto(
                          color: Theme.of(context).textSelectionColor,
                          fontWeight: FontWeight.w200,
                          fontSize: 14),
                      children: [
                        TextSpan(
                          text:
                              '\n${_appController.songModel.indexFaixa != null ? _appController.songModel.listSongPlayer[_appController.getFaixa].artist : ''}',
                          style: GoogleFonts.roboto(
                              color: Theme.of(context).textSelectionColor,
                              fontWeight: FontWeight.w100,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    maxLines: 3,
                  ),
                ),
              ),
              ButtonPlayerWidget(
                sizeButton: 40,
                onTap: () {
                  _appController.actionSong(
                      _appController.songModel
                          .listSongPlayer[_appController.getFaixa].filePath,
                      _appController.playerState);
                },
                icon: _appController.playerState == AudioPlayerState.PLAYING
                    ? Icons.pause
                    : Icons.play_arrow,
              ),
            ],
          ),
        ),
      );
    });
  }
}
