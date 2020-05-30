import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
