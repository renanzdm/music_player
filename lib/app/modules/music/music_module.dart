import 'package:flutter/src/widgets/framework.dart';
import 'package:musicplayer/app/modules/music/music_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/modules/music/music_page.dart';

class MusicModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => MusicController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => MusicPage()),
      ];

  static Inject get to => Inject<MusicModule>.of();

  @override
  // TODO: implement view
  Widget get view => MusicPage();
}