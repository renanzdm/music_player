import 'package:flutter/material.dart';
import 'package:musicplayer/app/modules/artists/artists_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/modules/artists/artists_page.dart';

class ArtistsModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ArtistsController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ArtistsPage()),
      ];

  static Inject get to => Inject<ArtistsModule>.of();

  @override
  Widget get view => ArtistsPage();
}
