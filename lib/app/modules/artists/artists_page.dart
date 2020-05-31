import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'artists_controller.dart';

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
      
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
