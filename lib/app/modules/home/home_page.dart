import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/app/modules/album/album_module.dart';
import 'package:musicplayer/app/modules/artist/artist_module.dart';
import 'package:musicplayer/app/modules/genre/genre_module.dart';
import 'package:musicplayer/app/modules/music/music_module.dart';
import 'package:musicplayer/app/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:musicplayer/app/shared/widgets/bottom_app_bar/bottom_app_bar_widget.dart';

import '../../app_controller.dart';
import '../../app_module.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  AppController _appController = AppModule.to.get();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBarWidget(
          onTapRigth: () {
            print(_appController.playerState);
            print(_appController.timeToMusic);
            print(_appController.audioDuration);
          },
          height: 50,
          iconLeft: Icons.search,
          iconRigth: Icons.more_vert,
        ),
        bottomNavigationBar: BottomAppBarWidget(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Text(
                'Biblioteca',
                style: GoogleFonts.roboto(
                  fontSize: 24,
                  color: Theme.of(context).textSelectionColor,
                ),
              ),
            ),
            TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle: GoogleFonts.roboto(fontWeight: FontWeight.w400),
                labelColor: Theme.of(context).textSelectionColor,
                unselectedLabelColor:
                    Theme.of(context).textSelectionColor.withOpacity(0.5),
                indicatorColor: Theme.of(context).accentColor,
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
                physics: NeverScrollableScrollPhysics(),
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
