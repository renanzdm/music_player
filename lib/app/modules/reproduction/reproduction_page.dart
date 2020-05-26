import 'dart:io';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/app/app_controller.dart';
import 'package:musicplayer/app/app_module.dart';
import 'package:musicplayer/app/shared/model/SongModel.dart';
import 'package:musicplayer/app/shared/model/waves_model.dart';
import 'package:musicplayer/app/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:musicplayer/app/shared/widgets/button_player/button_player_widget.dart';
import 'package:musicplayer/app/shared/widgets/waves/waves_widget.dart';

import 'reproduction_controller.dart';

class ReproductionPage extends StatefulWidget {
  final List<SongInfo> listSongInfo;
  final String indexFaixa;

  const ReproductionPage({this.listSongInfo, this.indexFaixa});

  @override
  _ReproductionPageState createState() => _ReproductionPageState();
}

class _ReproductionPageState
    extends ModularState<ReproductionPage, ReproductionController>
    with SingleTickerProviderStateMixin {
  AppController _appController = AppModule.to.get();
  SongModel songModel;
  static const size = const Size(100.0, 5.0);
  final random = Random();
  AnimationController animation;
  VibesTween tween;

  @override
  void initState() {
    controller.changeFaixa(int.parse(widget.indexFaixa));
    controller.timeToMusic = _appController.timeToMusic;
    controller.audioDuration = _appController.audioDuration;
    animation = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    tween = VibesTween(
      Wave.empty(size),
      Wave.random(size, random),
    );
    animation.forward();
    super.initState();
  }

  Future<bool> _onWillPop() async {
    songModel = SongModel(
      indexFaixa: controller.faixa,
      listSongPlayer: widget.listSongInfo,
      playerState: _appController.playerState,
    );
    _appController.getSongPlayer(songModel);

    return true;
  }

  void changeWave() {
    if (animation.status == AnimationStatus.completed) {
      setState(() {
      tween = VibesTween(
        tween.evaluate(animation),
        Wave.random(size, random),
      );
    });
    animation.forward(from: 0.0);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBarWidget(
          height: 50,
          iconLeft: Icons.arrow_back_ios,
          iconRigth: Icons.library_music,
          onTapLeft: () {
            Modular.to.maybePop(songModel);
          },
          onTapRigth: () {
            changeWave();
          },
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            double height = constraints.maxHeight;
            double width = constraints.maxWidth;
            return Observer(
              builder: (_) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  height: height,
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Hero(
                        tag: widget.listSongInfo[controller.faixa].id,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            _buildWaves(size, tween, animation),
                            Container(
                              height: height * 0.35,
                              width: height * 0.35,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: (widget
                                                .listSongInfo[controller.faixa]
                                                ?.albumArtwork !=
                                            null)
                                        ? FileImage(
                                            File(widget
                                                .listSongInfo[controller.faixa]
                                                ?.albumArtwork),
                                          )
                                        : AssetImage(
                                            'assets/note.png',
                                          ),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text.rich(
                          TextSpan(
                            text: widget
                                .listSongInfo[controller.faixa]?.displayName,
                            style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context).textSelectionColor),
                            children: [
                              TextSpan(
                                text:
                                    '\n${widget.listSongInfo[controller.faixa]?.artist}',
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
                      Column(
                        children: <Widget>[
                          Slider(
                            value: controller.progressBar,
                            min: 0,
                            max: 1,
                            onChanged: (value) {
                              controller.controllerProgressMusic(value);
                            },
                            activeColor: Theme.of(context).accentColor,
                            inactiveColor:
                                Theme.of(context).accentColor.withOpacity(0.5),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Text(
                                  controller.progressPositon,
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).textSelectionColor),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Text(
                                  controller.totalTimeSong,
                                  style: TextStyle(
                                      color:
                                          Theme.of(context).textSelectionColor),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            ButtonPlayerWidget(
                              onTap: () {
                                controller.previousSong(
                                    listSong: widget.listSongInfo);
                              },
                              icon: Icons.skip_previous,
                            ),
                            ButtonPlayerWidget(
                              sizeButton: 70,
                              onTap: () {
                                _appController.actionSong(
                                    widget.listSongInfo[controller.faixa]
                                        ?.filePath,
                                    _appController.playerState);
                              },
                              icon: _appController.playerState ==
                                      AudioPlayerState.PLAYING
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                            ButtonPlayerWidget(
                              onTap: () {
                                controller.nextSong(
                                    listSong: widget.listSongInfo);
                              },
                              icon: Icons.skip_next,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

Widget _buildWaves(Size size, VibesTween tween, AnimationController animation) {
  return Container(
    width: 340.00,
    height: 340.00,
    padding: const EdgeInsets.all(60.0),
    child: CustomPaint(
      size: size,
      painter: WavesPainter(tween.animate(animation)),
    ),
  );
}
