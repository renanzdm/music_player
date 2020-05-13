import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/shared/widgets/card_types/card_types_widget.dart';
import 'package:musicplayer/app/shared/widgets/playlist/playlist_widget.dart';
import 'album_controller.dart';

class AlbumPage extends StatefulWidget {
  final String title;
  const AlbumPage({Key key, this.title = "Album"}) : super(key: key);

  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends ModularState<AlbumPage, AlbumController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double height = constraints.maxHeight;
          final double width = constraints.maxWidth;
          return Column(
            children: <Widget>[
              Container(
                height: height * 0.45,
                width: width,
                child: Observer(
                  builder: (_) {
                    List<AlbumInfo> list = controller.listAlbuns;
                    if (list != null) {
                      return ListView.builder(
                        itemCount: list.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return CardTypesWidget(
                            width: width * 0.5,
                            albumInfo: list[index],
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.indigoAccent),
                        ),
                      );
                    }
                  },
                ),
              ),
              Expanded(child: PlaylistWidget()),
            ],
          );
        },
      ),
    );
  }
}
