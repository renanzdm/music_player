import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class CardArtistWidget extends StatelessWidget {
  final ArtistInfo artistInfo;
  final double width;
  final double height;

  const CardArtistWidget({Key key, this.artistInfo, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Modular.to.pushNamed('/artists/detailsArtist', arguments: artistInfo);
      },
      child: Column(
        children: <Widget>[
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade700,
                width: 0.5,
              ),
              color: Colors.orange,
              shape: BoxShape.circle,
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
          Text(
            (artistInfo.name),
            style: GoogleFonts.bebasNeue(fontSize: 14, color: Colors.white),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
