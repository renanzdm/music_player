import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'artist_controller.dart';

class ArtistPage extends StatefulWidget {
  final String title;
  const ArtistPage({Key key, this.title = "Artist"}) : super(key: key);

  @override
  _ArtistPageState createState() => _ArtistPageState();
}

class _ArtistPageState extends ModularState<ArtistPage, ArtistController> {
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
