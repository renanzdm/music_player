import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/modules/albuns/widgets/card_albuns/card_albuns_widget.dart';
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
                    if (controller.listAlbuns != null) {
                      List<AlbumInfo> list = controller.listAlbuns;
                      return GridView.builder(
                        itemCount: list.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 5,
                        ),
                        itemBuilder: (context, index) {
                          return CardAlbunsWidget(
                            albumInfo: list[index],
                            height: constraints.maxHeight * 0.15,
                            width: constraints.maxHeight * 0.15,
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
