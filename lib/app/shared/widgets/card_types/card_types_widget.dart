import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/app/shared/widgets/card_types/card_types_controller.dart';

class CardTypesWidget extends StatefulWidget {
  final double height;
  final double width;
  final String title;
  final String backgroundImage;

  const CardTypesWidget(
      {Key key, this.height, this.width, this.title, this.backgroundImage})
      : super(key: key);

  @override
  _CardTypesWidgetState createState() => _CardTypesWidgetState();
}

class _CardTypesWidgetState
    extends ModularState<CardTypesWidget, CardTypesController> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: controller.duration,
      height: widget.height,
      width: widget.width,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
            image: (widget.backgroundImage != null)
                ? FileImage(File(widget.backgroundImage))
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
          widget.title.toUpperCase(),
          style: GoogleFonts.roboto(
              color: Colors.grey.shade100,
              fontWeight: FontWeight.bold,
              letterSpacing: 4),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        width: widget.width,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16)),
        ),
      ),
    );
  }
}
