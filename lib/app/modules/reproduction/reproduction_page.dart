import 'dart:io';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/app/modules/reproduction/reproduction_controller.dart';
import 'package:musicplayer/app/shared/models/song_model.dart';
import 'package:musicplayer/app/shared/models/waves_model.dart';
import 'package:musicplayer/app/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:musicplayer/app/shared/widgets/button_player/button_player_widget.dart';
import 'package:musicplayer/app/shared/widgets/waves/waves_widget.dart';

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
  SongModel songModel;
  static const size = const Size(200.0, 5.0);
  final random = new Random();
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    controller.audioPlayer.onPlayerCompletion.listen((event) {
      controller.nextSong(listSong: widget.listSongInfo);
      songModel = SongModel(
        indexFaixa: controller.faixa,
        listSongPlayer: widget.listSongInfo,
        playerState: controller.audioStore.playerState,
      );
      controller.audioStore.getSongPlayer(songModel);
    });

    controller.changeFaixa(int.parse(widget.indexFaixa));
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    controller.tween = new VibesTween(
      new Wave.empty(size),
      new Wave.random(size, random),
    );
    animationController.forward();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.changeTween(animationController, size, random);
      } else if (controller.audioStore.playerState == AudioPlayerState.PAUSED ||
          controller.audioStore.playerState == AudioPlayerState.COMPLETED) {
        animationController.stop();
      }
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    songModel = SongModel(
      indexFaixa: controller.faixa,
      listSongPlayer: widget.listSongInfo,
      playerState: controller.audioStore.playerState,
    );
    controller.audioStore.getSongPlayer(songModel);

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBarWidget(
          height: 50,
          iconLeft: Icons.arrow_back_ios,
          iconRigth: Icons.library_music,
          onTapLeft: () {
            Modular.to.maybePop(songModel);
          },
          tabBar: Observer(builder: (_) {
            return Container(
              width: 200,
              child: Text(
                widget.listSongInfo[controller.faixa].artist,
                style: GoogleFonts.bebasNeue(fontSize: 18, color: Colors.white),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            );
          }),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
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
                      tag: widget.listSongInfo[controller.faixa].albumId,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 340.00,
                            height: 340.00,
                            padding: const EdgeInsets.all(65.0),
                            child: CustomPaint(
                              size: size,
                              painter: WavesPainter(controller.tween
                                  .animate(animationController)),
                            ),
                          ),
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
                                color: Colors.orange,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.orangeAccent, width: 5)),
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
                          style: GoogleFonts.bebasNeue(
                              fontSize: 15, color: Colors.white),
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
                          activeColor: Colors.orange,
                          inactiveColor: Colors.orange.shade200,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Text(
                                controller.progressPositon,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Text(
                                controller.totalTimeSong,
                                style: TextStyle(color: Colors.white),
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
                              animationController.forward();
                            },
                            icon: Icons.skip_previous,
                          ),
                          ButtonPlayerWidget(
                            sizeButton: 70,
                            onTap: () {
                              controller.audioStore.actionSong(
                                  widget
                                      .listSongInfo[controller.faixa]?.filePath,
                                  controller.audioStore.playerState);
                              animationController.forward();
                            },
                            icon: controller.audioStore.playerState ==
                                    AudioPlayerState.PLAYING
                                ? Icons.pause
                                : Icons.play_arrow,
                          ),
                          ButtonPlayerWidget(
                            onTap: () {
                              controller.nextSong(
                                  listSong: widget.listSongInfo);
                              animationController.forward();
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
        }),
      ),
    );
  }
}
