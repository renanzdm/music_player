import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/shared/widgets/card_albuns/card_albuns_widget.dart';
import 'albuns_controller.dart';

class AlbunsPage extends StatefulWidget {
  final String title;
  const AlbunsPage({Key key, this.title = "Albuns"}) : super(key: key);

  @override
  _AlbunsPageState createState() => _AlbunsPageState();
}

class _AlbunsPageState extends ModularState<AlbunsPage, AlbunsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          return Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Observer(builder: (_) {
              List<AlbumInfo> list = controller.listAlbuns;

              if (list != null) {
                return GridView.builder(
                  itemCount: list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisSpacing: 50),
                  itemBuilder: (context, index) {
                    return CardAlbunsWidget(
                      albumInfo: list[index],
                      height: constraints.maxHeight * 0.2,
                      width: constraints.maxHeight * 0.2,
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          );
        },
      ),
    );
  }
}
