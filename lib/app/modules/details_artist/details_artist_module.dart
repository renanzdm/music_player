import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:musicplayer/app/modules/details_artist/details_artist_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/modules/details_artist/details_artist_page.dart';

import '../../app_module.dart';

class DetailsArtistModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DetailsArtistController(
              AppModule.to.get<FlutterAudioQuery>(),
              AppModule.to.get<AudioPlayer>(),
            )),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => DetailsArtistPage(
                  artistsInfo: args.data,
                ),
            transition: TransitionType.leftToRight),
      ];

  static Inject get to => Inject<DetailsArtistModule>.of();
}
