import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/app/shared/widgets/app_bar/app_bar_widget.dart';

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
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBarWidget(
        height: 50,
        iconLeft: Icons.arrow_back_ios,
        iconRigth: Icons.search,
        onTapLeft: () {
          Modular.to.pop();
        },
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double height = constraints.maxHeight;
          double width = constraints.maxWidth * 0.5;
          return Column(
            children: <Widget>[
              Container(
                height: height * 0.35,
                child: Hero(
                  tag: widget.albumInfo.id,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: (widget.albumInfo.albumArt != null)
                                ? FileImage(File(widget.albumInfo.albumArt))
                                : AssetImage(
                                    'assets/note.png',
                                  ),
                            fit: BoxFit.fill,
                            alignment: Alignment.center),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.indigoAccent),
                    height: height * 0.2,
                    width: width * 0.9,
                  ),
                ),
              ),
              Container(
                height: height * 0.6,
                child: Observer(
                  builder: (_) {
                    List<SongInfo> list = controller.songs;
                    if (list != null) {
                      return ListView.builder(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        itemCount: list.length,
                        itemBuilder: (context, index) => Hero(
                          tag: list[index].id,
                          child: Card(
                            child: ListTile(
                              onTap: () async {
                                await controller
                                    .playSongSelected(list[index].filePath);
                                Modular.to.pushNamed('/reproduction/$index',
                                    arguments: list);
                              },
                              title: Text(
                                list[index].title,
                                style: GoogleFonts.openSansCondensed(
                                  fontSize: 18,
                                  color: Theme.of(context).textSelectionColor,
                                ),
                              ),
                              subtitle: Text(
                                list[index].artist,
                                style: GoogleFonts.openSansCondensed(
                                  textStyle: TextStyle(
                                      color:
                                          Theme.of(context).textSelectionColor),
                                ),
                              ),
                              trailing: GestureDetector(
                                onTap: () {
                                  print('teste');
                                },
                                child: Icon(
                                  Icons.more_vert,
                                  color: Theme.of(context).textSelectionColor,
                                ),
                              ),
                              leading: CircleAvatar(
                                  backgroundImage:
                                      widget.albumInfo.albumArt != null
                                          ? FileImage(
                                              File(
                                                widget.albumInfo.albumArt,
                                              ),
                                              scale: 1)
                                          : AssetImage(
                                              'assets/note.png',
                                            )),
                            ),
                          ),
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
