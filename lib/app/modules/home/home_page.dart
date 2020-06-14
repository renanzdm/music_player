import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicplayer/app/modules/albuns/albuns_module.dart';
import 'package:musicplayer/app/modules/artists/artists_module.dart';
import 'package:musicplayer/app/modules/songs/songs_module.dart';
import 'package:musicplayer/app/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:musicplayer/app/shared/widgets/bottom_app_bar/bottom_app_bar_widget.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with SingleTickerProviderStateMixin {
  //use 'controller' variable to access controller
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBarWidget(),
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBarWidget(
        iconLeft: Icons.search,
        iconRigth: Icons.more_vert,
        height: 50,
        tabBar: Expanded(
          child: TabBar(
            controller: tabController,
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
            ],
          ),
        ),
      ),
      body: Container(
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: tabController,
          children: [
            RouterOutlet(
              module: AlbunsModule(),
              keepAlive: true,
            ),
            RouterOutlet(
              module: SongsModule(),
              keepAlive: true,
            ),
            RouterOutlet(
              module: ArtistsModule(),
              keepAlive: true,
            ),
          ],
        ),
      ),
    );
  }
}
