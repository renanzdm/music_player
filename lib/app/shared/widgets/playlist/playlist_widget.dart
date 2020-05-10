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
                        color: Colors.red,
                      ),
                      leading: Container(
                        height: 40,
                        width: 40,
                        child: Icon(
                          Icons.playlist_add_check,
                          color: Colors.indigo.shade600,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.indigoAccent,
                              width: 2,
                              style: BorderStyle.solid),
                        ),
                      ));
                }),
          ),
        ],
      ),
    );
  }
}
