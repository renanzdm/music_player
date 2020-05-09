import 'package:flutter/src/widgets/framework.dart';
import 'package:musicplayer/app/modules/album/album_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/modules/album/album_page.dart';

class AlbumModule extends ModuleWidget{
  @override
  List<Bind> get binds => [
        Bind((i) => AlbumController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AlbumPage()),
      ];

  static Inject get to => Inject<AlbumModule>.of();

  @override
  // TODO: implement view
  Widget get view => AlbumModule();
}
