import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaylistWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Text(
              'Playlists'.toUpperCase(),
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(
                      'Titulo Playlist',
                      style: GoogleFonts.roboto(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: Text('Songs'),
                    trailing: Icon(
                      Icons.favorite_border,
                      color: Colors.grey.shade400,
                    ),
                    leading: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.grey.shade100,
                        size: 14,
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
