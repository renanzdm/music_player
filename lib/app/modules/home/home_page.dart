import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/app/modules/albuns/albuns_module.dart';
import 'package:musicplayer/app/modules/artists/artists_module.dart';
import 'package:musicplayer/app/modules/songs/songs_module.dart';
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
      length: 3,
      child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBarWidget(
            iconLeft: Icons.search,
            iconRigth: Icons.more_vert,
            height: 50,
            tabBar: Expanded(
                child: TabBar(
                    unselectedLabelStyle: GoogleFonts.bebasNeue(fontSize: 14),
                    labelStyle: GoogleFonts.bebasNeue(fontSize: 20),
                    labelColor: Colors.orange,
                    unselectedLabelColor: Colors.white,
                    indicatorColor: Colors.transparent,
                    tabs: [
                  Tab(
                    text: 'Albuns',
                  ),
                  Tab(
                    text: 'Músicas',
                  ),
                  Tab(
                    text: 'Artistas',
                  ),
                ])),
          ),
          body: Container(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                RouterOutlet(module: AlbunsModule()),
                RouterOutlet(module: SongsModule()),
                RouterOutlet(module: ArtistsModule()),
              ],
            ),
          )),
    );
  }
}
