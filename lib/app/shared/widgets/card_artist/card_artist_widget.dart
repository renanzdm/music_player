import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class CardArtistWidget extends StatelessWidget {
  final ArtistInfo artistInfo;
  final double width;

  const CardArtistWidget({Key key, this.artistInfo, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Modular.to.pushNamed('detailsArtist', arguments: artistInfo);
      },
      child: Hero(
        tag: (artistInfo.id),
        child: Column(
          children: <Widget>[
            Container(
              width: width,
              height: width + 20,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: (artistInfo?.artistArtPath != null)
                        ? FileImage(File(artistInfo.artistArtPath))
                        : AssetImage(
                            'assets/note.png',
                          ),
                    fit: BoxFit.fill,
                    alignment: Alignment.center),
              ),
              alignment: Alignment.bottomCenter,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                (artistInfo.name),
                style: GoogleFonts.roboto(
                    color: Colors.grey.shade100,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              width: width,
            ),
          ],
        ),
      ),
    );
  }
}
