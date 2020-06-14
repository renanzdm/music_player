import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsCardWidget extends StatelessWidget {
  final VoidCallback onTap;
  final SongInfo songInfo;

  const DetailsCardWidget({Key key, this.onTap, this.songInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        songInfo.title,
        style: GoogleFonts.bebasNeue(fontSize: 16, color: Colors.white),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        songInfo.artist,
        style: GoogleFonts.roboto(fontSize: 12, color: Colors.white),
        overflow: TextOverflow.ellipsis,
      ),
      leading: CircleAvatar(
        backgroundColor: Colors.orange,
        radius: 25,
        backgroundImage: songInfo.albumArtwork != null
            ? FileImage(
                File(songInfo.albumArtwork),
              )
            : AssetImage(
                'assets/note.png',
              ),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}
