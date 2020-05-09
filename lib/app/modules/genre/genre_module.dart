import 'package:flutter/src/widgets/framework.dart';
import 'package:musicplayer/app/modules/genre/genre_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/modules/genre/genre_page.dart';

class GenreModule extends ModuleWidget {
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
  // TODO: implement view
  Widget get view => GenrePage();
}
