import 'package:flutter/src/widgets/framework.dart';
import 'package:musicplayer/app/modules/artist/artist_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/modules/artist/artist_page.dart';

class ArtistModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => ArtistController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ArtistPage()),
      ];

  static Inject get to => Inject<ArtistModule>.of();

  @override
  // TODO: implement view
  Widget get view => ArtistPage();
}
