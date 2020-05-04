import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/shared/utils/colors.dart';
import 'package:musicplayer/app/shared/widgets/video_tile/video_tile_widget.dart';

import '../../shared/model/video_model.dart';
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

  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: sizes.height,
        child: Observer(
          builder: (_) {
            List<VideoModel> videos = controller.videos;
            if (videos != null) {
              return ListView.builder(
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  return VideoTileWidget(
                    title: videos[index].title,
                    imgUrl: videos[index].thumb,
                    channel: videos[index].channel,
                    videoId: videos[index].id,
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
