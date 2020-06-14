import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class CardAlbunsWidget extends StatelessWidget {
  final double height;
  final double width;
  final AlbumInfo albumInfo;

  const CardAlbunsWidget({Key key, this.height, this.width, this.albumInfo})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Modular.to.pushNamed('/albuns/detailsAlbum', arguments: albumInfo);
          },
          child: Hero(
            tag: albumInfo.id,
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade700,
                  width: 0.5,
                ),
                color: Colors.orange,
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
          ),
        ),
        Text(
          albumInfo.title,
          style: GoogleFonts.bebasNeue(fontSize: 14, color: Colors.white),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
