import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTypesWidget extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final String backgroundImage;

  const CardTypesWidget(
      {Key key, this.height, this.width, this.title, this.backgroundImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Modular.to.pushNamed('/details',arguments:backgroundImage);
      },
          child: Hero(
            tag: title,
                      child: Container(
        height: height,
        width: width,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
                image: (backgroundImage != null)
                    ? FileImage(File(backgroundImage))
                    : AssetImage(
                        'assets/note.png',
                      ),
                fit: BoxFit.fill,
                alignment: Alignment.center),
        ),
        alignment: Alignment.bottomCenter,
        child: Container(
            alignment: Alignment.center,
            child: Text(
              title.toUpperCase(),
              style: GoogleFonts.roboto(
                  color: Colors.grey.shade100,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            width: width,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
            ),
        ),
      ),
          ),
    );
  }
}
