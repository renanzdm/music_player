import 'package:flutter/material.dart';
import 'package:musicplayer/app/modules/genre/genre_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/modules/genre/genre_page.dart';

class GenreModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => GenreController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => GenrePage()),
      ];

  static Inject get to => Inject<GenreModule>.of();

  @override
  Widget get view => GenrePage();
}
