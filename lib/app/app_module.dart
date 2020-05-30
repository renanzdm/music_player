import 'package:musicplayer/app/shared/repositories/audio_repository.dart';
import 'package:musicplayer/app/shared/widgets/artist/artist_controller.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/app_controller.dart';
import 'package:musicplayer/app/app_widget.dart';
import 'package:musicplayer/app/modules/home/home_module.dart';
import 'package:musicplayer/app/modules/reproduction/reproduction_module.dart';

import 'modules/details_album/details_album_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ArtistController()),
        Bind((i) => AudioRepository(i.get<FlutterAudioQuery>())),
        Bind((i) => AppController(i.get<AudioPlayer>())),
        Bind((i) => FlutterAudioQuery()),
        Bind((i) => AudioPlayer(playerId: 'My_player')),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/details', module: DetailsAlbumModule()),
        Router('/reproduction', module: ReproductionModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
