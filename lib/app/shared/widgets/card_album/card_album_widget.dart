import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class CardAlbumWidget extends StatelessWidget {
  final double width;
  final AlbumInfo albumInfo;

  const CardAlbumWidget({Key key, this.width, this.albumInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Modular.to.pushNamed('/detailsAlbum', arguments: albumInfo);
      },
      child: Hero(
        tag: albumInfo.id,
        child: Column(
          children: <Widget>[
            Container(
              width: width,
              height: width,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: (albumInfo?.albumArt != null)
                        ? FileImage(File(albumInfo.albumArt))
                        : AssetImage(
                            'assets/note.png',
                          ),
                    fit: BoxFit.fill,
                    alignment: Alignment.center),
              ),
            ),
            Container(
              child: Text(
                albumInfo.title.toUpperCase(),
                style: GoogleFonts.roboto(
                    color: Colors.grey.shade100,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              width: width,
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
