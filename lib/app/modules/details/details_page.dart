import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/app/shared/widgets/app_bar/app_bar_widget.dart';
import 'details_controller.dart';

class DetailsPage extends StatefulWidget {
  final String title;
  final String tagHero;
  const DetailsPage({Key key, this.title = "Details", this.tagHero})
      : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends ModularState<DetailsPage, DetailsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        height: 40,
        iconLeft: Icons.arrow_back_ios,
        iconRigth: Icons.search,
        onTapLeft: () {
          Modular.to.pop();
        },
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double height = constraints.maxHeight;
          double width = constraints.maxWidth * 0.5;
          return Column(
            children: <Widget>[
              Container(
                height: height * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.indigoAccent),
                      height: height * 0.3,
                      width: width * 0.3,
                    ),
                    Hero(
                      tag: widget.tagHero,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: (widget.tagHero != null)
                                    ? FileImage(File(widget.tagHero))
                                    : AssetImage(
                                        'assets/note.png',
                                      ),
                                fit: BoxFit.fill,
                                alignment: Alignment.center),
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.indigoAccent),
                        height: height * 0.35,
                        width: width * 0.9,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.indigoAccent),
                      height: height * 0.3,
                      width: width * 0.3,
                    )
                  ],
                ),
              ),
              Container(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      'Nome da Música',
                      style: GoogleFonts.openSansCondensed(fontSize: 18),
                    ),
                    subtitle:
                        Text('data', style: GoogleFonts.openSansCondensed()),
                    trailing: Icon(Icons.more_vert),
                    leading: CircleAvatar(
                      radius: 30,
                    ),
                  ),
                ),
                height: height * 0.6,
              ),
            ],
          );
        },
      ),
    );
  }
}
