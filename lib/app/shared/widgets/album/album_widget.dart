import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musicplayer/app/modules/home/home_module.dart';
import 'package:musicplayer/app/shared/widgets/album/album_controller.dart';
import 'package:musicplayer/app/shared/widgets/card_album/card_album_widget.dart';

class AlbumWidget extends StatelessWidget {
  final double height;

  const AlbumWidget({Key key, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final AlbumController _albumController = HomeModule.to.get();
    return Container(
      height: height,
      child: Observer(
        builder: (_) {
          List<AlbumInfo> list = _albumController.listAlbuns;
          if (list != null) {
            return ListView.builder(
              itemCount: list.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CardAlbumWidget(
                  width: height,
                  albumInfo: list[index],
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.indigoAccent),
              ),
            );
          }
        },
      ),
    );
  }
}
