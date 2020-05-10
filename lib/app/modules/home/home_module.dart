import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:musicplayer/app/modules/album/album_controller.dart';
import 'package:musicplayer/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => AlbumController(i.get<FlutterAudioQuery>())),
        Bind((i) => FlutterAudioQuery()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
