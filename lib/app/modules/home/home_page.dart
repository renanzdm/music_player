import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/app/modules/album/album_module.dart';
import 'package:musicplayer/app/modules/artist/artist_module.dart';
import 'package:musicplayer/app/modules/genre/genre_module.dart';
import 'package:musicplayer/app/modules/music/music_module.dart';
import 'package:musicplayer/app/shared/widgets/app_bar/app_bar_widget.dart';
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBarWidget(
          height: 50,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Biblioteca',
                style: GoogleFonts.roboto(fontSize: 24, color: Colors.grey.shade700),
              ),
            ),
            TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: GoogleFonts.roboto(fontWeight: FontWeight.w400),
                labelColor: Colors.grey.shade700,
                unselectedLabelColor: Colors.grey.shade400,
                tabs: [
                  Tab(
                    text: 'Album',
                  ),
                  Tab(
                    text: 'Artista',
                  ),
                  Tab(
                    text: 'Musicas',
                  ),
                  Tab(
                    text: 'Gêneros',
                  ),
                ]),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  RouterOutlet(
                    module: AlbumModule(),
                  ),
                  RouterOutlet(
                    module: ArtistModule(),
                  ),
                  RouterOutlet(
                    module: MusicModule(),
                  ),
                  RouterOutlet(
                    module: GenreModule(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
