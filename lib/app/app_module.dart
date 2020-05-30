import 'package:musicplayer/app/shared/widgets/card_artist/card_artist_controller.dart';
import 'package:musicplayer/app/shared/services/audio_service.dart';
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
import 'modules/details_artist/details_artist_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CardArtistController()),
        Bind((i) => FlutterAudioQuery()),
        Bind((i) => AudioService(i.get<FlutterAudioQuery>())),
        Bind((i) => AppController(i.get<AudioPlayer>())),
        Bind((i) => FlutterAudioQuery()),
        Bind((i) => AudioPlayer(playerId: 'My_player')),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/detailsAlbum', module: DetailsAlbumModule()),
        Router('/reproduction', module: ReproductionModule()),
        Router('/detailsArtist', module: DetailsArtistModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
