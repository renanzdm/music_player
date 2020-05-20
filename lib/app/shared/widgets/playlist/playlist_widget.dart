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
                color: Theme.of(context).textSelectionColor,
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
                          color: Theme.of(context).textSelectionColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Songs',
                        style: GoogleFonts.roboto(
                          color: Theme.of(context).textSelectionColor,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      trailing: Icon(
                        Icons.favorite_border,
                        color: Theme.of(context).accentColor,
                      ),
                      leading: Container(
                        height: 35,
                        width: 35,
                        child: Icon(
                          Icons.playlist_add_check,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).disabledColor,
                          shape: BoxShape.circle,
                        ),
                      ));
                }),
          ),
        ],
      ),
    );
  }
}
