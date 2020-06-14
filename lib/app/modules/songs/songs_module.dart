import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/modules/songs/songs_controller.dart';
import 'package:musicplayer/app/modules/songs/songs_page.dart';

class SongsModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SongsController(i.get(), i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SongsPage()),
      ];

  static Inject get to => Inject<SongsModule>.of();

  @override
  Widget get view => SongsPage();
}
