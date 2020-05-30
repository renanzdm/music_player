import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/modules/home/home_controller.dart';
import 'package:musicplayer/app/modules/home/home_page.dart';
import 'package:musicplayer/app/shared/services/audio_service.dart';
import 'package:musicplayer/app/shared/widgets/album/album_controller.dart';
import 'package:musicplayer/app/shared/widgets/artist/artist_controller.dart';

import '../../app_module.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AlbumController(AppModule.to.get<AudioService>())),
        Bind((i) => ArtistController(AppModule.to.get<AudioService>())),
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
