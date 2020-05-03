import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/shared/utils/colors.dart';

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
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () async {
                Modular.to.pushNamed(Modular.initialRoute);
              },
              title: Text('Text$index'),
            );
          },
        ),
      ),
    );
  }
}
