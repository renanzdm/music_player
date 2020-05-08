import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/shared/widgets/album_card/album_card_widget.dart';

import 'list_music_controller.dart';

class ListMusicPage extends StatefulWidget {
  final String title;

  const ListMusicPage({Key key, this.title = "ListMusic"}) : super(key: key);

  @override
  _ListMusicPageState createState() => _ListMusicPageState();
}

class _ListMusicPageState
    extends ModularState<ListMusicPage, ListMusicController> {
  //use 'controller' variable to access controller
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();

  getArtist() async {
    List<SongInfo> songs = await audioQuery.getSongs();
    songs.forEach((song) {
      print(song.displayName);
    });
  }

  @override
  void initState() {
    super.initState();
    getArtist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double heigth = constraints.maxHeight;
          double width = constraints.maxWidth;
          return Container(
            height: heigth,
            width: width,
            color: Colors.grey,
            child: PageView.builder(
              controller: PageController(
                viewportFraction: 0.70,
              ),
              onPageChanged: (pageSelect) {
                controller.setPage(pageSelect);
              },
              itemBuilder: (_, index) => Observer(
                builder: (_) => AnimatedOpacity(
                  opacity: controller.currentPage == index ? 1.0 : 0.4,
                  duration: controller.duration,
                  child: AlbumCardWidget(
                    itemSelected: controller.currentPage == index,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
