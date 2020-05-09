import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'music_controller.dart';

class MusicPage extends StatefulWidget {
  final String title;
  const MusicPage({Key key, this.title = "Music"}) : super(key: key);

  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends ModularState<MusicPage, MusicController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
