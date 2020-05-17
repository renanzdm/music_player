import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/reproduction',);
      },
      child: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text.rich(
                TextSpan(
                  text: 'Nome da música',
                  style: GoogleFonts.roboto(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                  children: [
                    TextSpan(
                      text: '\nNome do Artista',
                      style: GoogleFonts.roboto(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w300,
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                radius: 20,
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.grey.shade100,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
