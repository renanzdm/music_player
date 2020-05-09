import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'album_controller.dart';

class AlbumPage extends StatefulWidget {
  final String title;
  const AlbumPage({Key key, this.title = "Album"}) : super(key: key);

  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends ModularState<AlbumPage, AlbumController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
        itemCount: 10 ,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Container(
                    height: 100,
                    width: 200,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(16)),
                  );
                }),
          )
        ],
      ),
    );
  }
}
