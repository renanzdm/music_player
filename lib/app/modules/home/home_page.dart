import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/app/shared/widgets/album/album_widget.dart';
import 'package:musicplayer/app/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:musicplayer/app/shared/widgets/artist/artist_widget.dart';
import 'package:musicplayer/app/shared/widgets/bottom_app_bar/bottom_app_bar_widget.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBarWidget(
        onTapRigth: () {},
        height: 50,
        iconRigth: Icons.more_vert,
        title: 'Biblioteca',
      ),
      bottomNavigationBar: BottomAppBarWidget(
        width: MediaQuery.of(context).size.width * 0.8,
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: null, label: Text('Músicas')),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Albuns',
                        style: GoogleFonts.roboto(
                          color: Theme.of(context).textSelectionColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    AlbumWidget(
                      height: constraints.maxHeight * 0.30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Artistas',
                        style: GoogleFonts.roboto(
                          color: Theme.of(context).textSelectionColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ArtistWidget(
                      height: constraints.maxHeight * 0.25,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
