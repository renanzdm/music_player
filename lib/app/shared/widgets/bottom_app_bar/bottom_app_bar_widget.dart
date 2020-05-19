import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/app/app_module.dart';

import '../../../app_controller.dart';

class BottomAppBarWidget extends StatelessWidget {
  final SongInfo songInfo;

  const BottomAppBarWidget({Key key, this.songInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController _appController = AppModule.to.get();

    return Observer(builder: (_) {
      return GestureDetector(
        onTap: () {
          Modular.to.pushNamed('/reproduction',
              arguments: _appController.listSongInfo);
        },
        child: BottomAppBar(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text.rich(
                    TextSpan(
                      text: _appController.songInfoPlayer != null
                          ? _appController.songInfoPlayer.displayName
                          : 'Nada Reproduzindo',
                      style: GoogleFonts.roboto(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                      children: [
                        TextSpan(
                          text:
                              '\n${_appController.songInfoPlayer != null ? _appController.songInfoPlayer.artist : ''}',
                          style: GoogleFonts.roboto(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w300,
                              fontSize: 12),
                        ),
                      ],
                    ),
                    maxLines: 3,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 20,
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.grey.shade100,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
