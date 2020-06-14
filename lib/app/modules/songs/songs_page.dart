import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/shared/widgets/details_card/details_card_widget.dart';
import 'songs_controller.dart';

class SongsPage extends StatefulWidget {
  final String title;
  const SongsPage({Key key, this.title = "Songs"}) : super(key: key);

  @override
  _SongsPageState createState() => _SongsPageState();
}

class _SongsPageState extends ModularState<SongsPage, SongsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          child: Observer(builder: (_) {
            if (controller.listSongs != null) {
              return ListView.builder(
                  itemCount: controller.listSongs.length,
                  itemBuilder: (_, index) {
                    return DetailsCardWidget(
                      songInfo: controller.listSongs[index],
                      onTap: () async {
                        await controller.audioStore.playSongSelected(
                          controller.listSongs[index].filePath,
                        );
                        await Modular.to.pushNamed('/reproduction/$index',
                            arguments: controller.listSongs);
                      },
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ));
  }
}
