import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class CardAlbunsWidget extends StatelessWidget {
  final double height;
  final double width;
  final AlbumInfo albumInfo;

  const CardAlbunsWidget({Key key, this.height, this.width, this.albumInfo})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flexible(
          child: Column(
        children: <Widget>[
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: (albumInfo.albumArt != null)
                      ? FileImage(File(albumInfo.albumArt))
                      : AssetImage(
                          'assets/note.png',
                        ),
                  fit: BoxFit.cover,
                  ),
            ),
          ),
          Text(albumInfo.title)
        ],
      ),
    );
  }
}
