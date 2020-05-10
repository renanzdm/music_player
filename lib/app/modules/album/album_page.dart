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
  String message;

  //use 'controller' variable to access controller

  // _onStartScroll(ScrollMetrics metrics) {
  //   setState(() {
  //     message = "Scroll Start";
  //     print(message);
  //   });
  // }

  _onUpdateScroll(ScrollMetrics metrics) {
    setState(() {
      message = "Scroll Update";
      print(message);
    });
  }

  // _onEndScroll(ScrollMetrics metrics) {
  //   setState(() {
  //     message = "Scroll End";
  //     print(message);
  //   });
  // }

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
                      return NotificationListener<ScrollNotification>(
                        onNotification: (scrollNotification) {
                          if (scrollNotification is ScrollStartNotification) {
                            return _onUpdateScroll(scrollNotification.metrics);
                          }
                        },
                        child: ListView.builder(
                          itemCount: list.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return CardTypesWidget(
                              width: width * 0.5,
                              title: list[index].title,
                              backgroundImage: list[index].albumArt,
                            );
                          },
                        ),
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
