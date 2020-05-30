import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:musicplayer/app/modules/home/home_module.dart';
import 'package:musicplayer/app/shared/widgets/artist/artist_controller.dart';
import 'package:musicplayer/app/shared/widgets/card_artist/card_artist_widget.dart';

class ArtistWidget extends StatelessWidget {
  final double height;

  const ArtistWidget({Key key, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ArtistController _artistController = HomeModule.to.get();
    return Container(
      height: height + 100,
      child: Observer(
        builder: (_) {
          List<ArtistInfo> list = _artistController.listArtists;
          if (list != null) {
            return ListView.builder(
              itemCount: list.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CardArtistWidget(
                  width: height,
                  artistInfo: list[index],
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
