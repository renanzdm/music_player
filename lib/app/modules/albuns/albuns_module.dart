import 'package:flutter/material.dart';
import 'package:musicplayer/app/modules/albuns/albuns_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/modules/albuns/albuns_page.dart';

class AlbunsModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AlbunsController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AlbunsPage()),
      ];

  static Inject get to => Inject<AlbunsModule>.of();

  @override
  Widget get view => AlbunsPage();
}
