import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/app/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:musicplayer/app/shared/widgets/details_card/details_card_widget.dart';
import 'details_album_controller.dart';

class DetailsAlbumPage extends StatefulWidget {
  final String title;
  final AlbumInfo albumInfo;

  const DetailsAlbumPage({Key key, this.title = "Details", this.albumInfo})
      : super(key: key);

  @override
  _DetailsAlbumPageState createState() => _DetailsAlbumPageState();
}

class _DetailsAlbumPageState
    extends ModularState<DetailsAlbumPage, DetailsAlbumController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();
    controller.getSongs(widget.albumInfo.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBarWidget(
        height: 50,
        iconLeft: Icons.arrow_back_ios,
        iconRigth: Icons.search,
        onTapLeft: () {
          Modular.to.pop();
        },
        tabBar: Container(
          width: 200,
          child: Text(
            widget.albumInfo.title,
            style: GoogleFonts.bebasNeue(fontSize: 18, color: Colors.white),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double height = constraints.maxHeight;
          double width = constraints.maxWidth;
          return Column(
            children: <Widget>[
              Hero(
                  tag: widget.albumInfo.id,
                  child: Container(
                    height: height * 0.35,
                    width: height * 0.35,
                    child: CircleAvatar(
                      backgroundColor: Colors.orange,
                      backgroundImage: (widget.albumInfo.albumArt != null)
                          ? FileImage(File(widget.albumInfo.albumArt))
                          : AssetImage(
                              'assets/note.png',
                            ),
                    ),
                  )),
              Container(
                height: height * 0.65,
                child: Observer(
                  builder: (_) {
                    List<SongInfo> list = controller.songs;
                    if (list != null) {
                      return ListView.builder(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        itemCount: list.length,
                        itemBuilder: (context, index) => DetailsCardWidget(
                          onTap: () async {
                            await controller.audioStore.playSongSelected(
                              list[index].filePath,
                            );
                            await Modular.to.pushNamed('/reproduction/$index',
                                arguments: list);
                          },
                          songInfo: list[index],
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
