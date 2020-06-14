import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'artists_controller.dart';
import 'widgets/card_artist/card_artist_widget.dart';

class ArtistsPage extends StatefulWidget {
  final String title;

  const ArtistsPage({Key key, this.title = "Artists"}) : super(key: key);

  @override
  _ArtistsPageState createState() => _ArtistsPageState();
}

class _ArtistsPageState extends ModularState<ArtistsPage, ArtistsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: LayoutBuilder(
        builder: (_, constraints) {
          return Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topRight,
                height: constraints.maxHeight * 0.05,
                child: IconButton(
                  icon: Icon(
                    Icons.sort,
                    size: constraints.maxHeight * 0.05,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                height: constraints.maxHeight * 0.95,
                child: Observer(
                  builder: (_) {
                    if (controller.listArtists != null) {
                      List<ArtistInfo> list = controller.listArtists;
                      return GridView.builder(
                        itemCount: list.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.9),
                        itemBuilder: (context, index) {
                          return CardArtistWidget(
                            artistInfo: list[index],
                            height: constraints.maxHeight * 0.25,
                            width: constraints.maxHeight * 0.25,
                          );
                        },
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
