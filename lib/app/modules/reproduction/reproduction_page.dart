import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/app/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:musicplayer/app/shared/widgets/button_player/button_player_widget.dart';
import 'reproduction_controller.dart';

class ReproductionPage extends StatefulWidget {
  final String title;
  final SongInfo songInfo;
  const ReproductionPage({Key key, this.title = "Reproduction", this.songInfo})
      : super(key: key);

  @override
  _ReproductionPageState createState() => _ReproductionPageState();
}

class _ReproductionPageState
    extends ModularState<ReproductionPage, ReproductionController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          height: 50,
          iconLeft: Icons.arrow_back_ios,
          iconRigth: Icons.library_music,
          onTapLeft: () {
            Modular.to.pop();
          },
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          double height = constraints.maxHeight;
          double width = constraints.maxWidth;
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: widget.songInfo.id,
                  child: Container(
                    height: height * 0.4,
                    width: height * 0.4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: (widget.songInfo.albumArtwork != null)
                              ? FileImage(File(widget.songInfo.albumArtwork))
                              : AssetImage(
                                  'assets/note.png',
                                ),
                          fit: BoxFit.fill,
                          alignment: Alignment.center),
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text.rich(
                    TextSpan(
                      text: widget.songInfo.displayName,
                      style: GoogleFonts.roboto(
                          fontSize: 15, fontWeight: FontWeight.w700),
                      children: [
                        TextSpan(
                          text: '\n${widget.songInfo.artist}',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
                Slider(
                  value: 0.5,
                  onChanged: (value) {},
                  activeColor: Theme.of(context).primaryColor,
                  inactiveColor:
                      Theme.of(context).primaryColor.withOpacity(0.5),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ButtonPlayerWidget(
                        onTap: () {},
                        icon: Icons.skip_previous,
                      ),
                      ButtonPlayerWidget(
                        sizeButton: 70,
                        onTap: () {
                          controller.playLocal(widget.songInfo.filePath);
                        },
                        icon: Icons.play_arrow,
                      ),
                      ButtonPlayerWidget(
                        onTap: () {},
                        icon: Icons.skip_next,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }));
  }
}