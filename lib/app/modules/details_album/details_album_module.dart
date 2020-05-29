import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/modules/details_album/details_album_page.dart';

import '../../app_module.dart';
import 'details_album_controller.dart';

class DetailsAlbumModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => DetailsAlbumController(
            AppModule.to.get<FlutterAudioQuery>(),
            AppModule.to.get<AudioPlayer>(),
          ),
        ),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => DetailsAlbumPage(
                  albumInfo: args.data,
                ),
            transition: TransitionType.leftToRight),
      ];

  static Inject get to => Inject<DetailsAlbumModule>.of();
}
