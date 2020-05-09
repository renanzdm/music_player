import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'genre_controller.dart';

class GenrePage extends StatefulWidget {
  final String title;
  const GenrePage({Key key, this.title = "Genre"}) : super(key: key);

  @override
  _GenrePageState createState() => _GenrePageState();
}

class _GenrePageState extends ModularState<GenrePage, GenreController> {
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
