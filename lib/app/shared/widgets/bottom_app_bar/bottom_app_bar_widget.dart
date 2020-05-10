import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomAppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text.rich(
              TextSpan(
                text: 'Tocando Agora',
                style: GoogleFonts.roboto(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
                children: [
                  TextSpan(
                    text: '\nNome da música',
                    style: GoogleFonts.roboto(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w300,
                        fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            child: CircleAvatar(
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
    );
  }
}
