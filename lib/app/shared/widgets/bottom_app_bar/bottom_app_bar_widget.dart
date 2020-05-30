import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/app/app_module.dart';
import 'package:musicplayer/app/shared/widgets/button_player/button_player_widget.dart';

import '../../../app_controller.dart';

class BottomAppBarWidget extends StatelessWidget {
  final double width;

  const BottomAppBarWidget({Key key, this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppController _appController = AppModule.to.get();

    return Observer(builder: (_) {
      return _appController.songModel.indexFaixa != null
          ? GestureDetector(
              onTap: _appController.getFaixa != null
                  ? () {
                      Modular.to.pushNamed(
                          '/reproduction/${_appController.getFaixa}',
                          arguments: _appController.songModel.listSongPlayer);
                    }
                  : null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Transform.rotate(
                    angle: _appController.timeToMusic.inSeconds.toDouble() / 10,
                    child: Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink,
                        image: DecorationImage(
                          image: (_appController
                                      .songModel
                                      .listSongPlayer[_appController.getFaixa]
                                      .albumArtwork !=
                                  null)
                              ? FileImage(File(_appController
                                  .songModel
                                  .listSongPlayer[_appController.getFaixa]
                                  .albumArtwork))
                              : AssetImage(
                                  'assets/disc.png',
                                ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: ClipBottomAppBar(),
                    child: Container(
                      margin: EdgeInsets.zero,
                      height: 50,
                      width: width,
                      decoration: BoxDecoration(
                        color: Theme.of(context).disabledColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text.rich(
                                TextSpan(
                                  text: _appController
                                      .songModel
                                      .listSongPlayer[_appController.getFaixa]
                                      .displayName,
                                  style: GoogleFonts.roboto(
                                      color:
                                          Theme.of(context).textSelectionColor,
                                      fontWeight: FontWeight.w200,
                                      fontSize: 14),
                                  children: [
                                    TextSpan(
                                      text:
                                          '\n${_appController.songModel.listSongPlayer[_appController.getFaixa].artist}',
                                      style: GoogleFonts.roboto(
                                          color: Theme.of(context)
                                              .textSelectionColor,
                                          fontWeight: FontWeight.w100,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                maxLines: 2,
                              ),
                            ),
                          ),
                          ButtonPlayerWidget(
                            sizeButton: 40,
                            onTap: () {
                              _appController.actionSong(
                                  _appController
                                      .songModel
                                      .listSongPlayer[_appController.getFaixa]
                                      .filePath,
                                  _appController.playerState);
                            },
                            icon: _appController.playerState ==
                                    AudioPlayerState.PLAYING
                                ? Icons.pause
                                : Icons.play_arrow,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container();
    });
  }
}

class ClipBottomAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    var pointControl = Offset(size.width * 0.06, size.height / 2);
    var endPoint = Offset(0, 0);
    path.quadraticBezierTo(
        pointControl.dx, pointControl.dy, endPoint.dx, endPoint.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}

// return Observer(builder: (_) {
//       return GestureDetector(
//         onTap: _appController.getFaixa != null
//             ? () {
//                 Modular.to.pushNamed('/reproduction/${_appController.getFaixa}',
//                     arguments: _appController.songModel.listSongPlayer);
//               }
//             : null,
//         child: Container(
//           height: 50,
//           margin: EdgeInsets.only(left: 8, right: 8, bottom: 10),
//           padding: EdgeInsets.all(4),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(14),
//             color: Theme.of(context).disabledColor,
//           ),
//           child: Row(
//             children: <Widget>[
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                   child: Text.rich(
//                     TextSpan(
//                       text: _appController.songModel.indexFaixa != null
//                           ? _appController
//                               .songModel
//                               .listSongPlayer[_appController.getFaixa]
//                               .displayName
//                           : 'Nada Reproduzindo',
//                       style: GoogleFonts.roboto(
//                           color: Theme.of(context).textSelectionColor,
//                           fontWeight: FontWeight.w200,
//                           fontSize: 14),
//                       children: [
//                         TextSpan(
//                           text:
//                               '\n${_appController.songModel.indexFaixa != null ? _appController.songModel.listSongPlayer[_appController.getFaixa].artist : ''}',
//                           style: GoogleFonts.roboto(
//                               color: Theme.of(context).textSelectionColor,
//                               fontWeight: FontWeight.w100,
//                               fontSize: 12),
//                         ),
//                       ],
//                     ),
//                     maxLines: 2,
//                   ),
//                 ),
//               ),
//               ButtonPlayerWidget(
//                 sizeButton: 40,
//                 onTap: () {
//                   _appController.actionSong(
//                       _appController.songModel
//                           .listSongPlayer[_appController.getFaixa].filePath,
//                       _appController.playerState);
//                 },
//                 icon: _appController.playerState == AudioPlayerState.PLAYING
//                     ? Icons.pause
//                     : Icons.play_arrow,
//               ),
//             ],
//           ),
//         ),
//       );
//     });
