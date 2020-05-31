import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
     
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
