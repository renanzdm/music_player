import 'package:musicplayer/app/shared/widgets/button_player/button_player_controller.dart';
import 'package:musicplayer/app/shared/widgets/stores/audio_store.dart';
import 'package:musicplayer/app/shared/widgets/waves/waves_controller.dart';
import 'package:musicplayer/app/shared/widgets/card_albuns/card_albuns_controller.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:musicplayer/app/shared/services/audio_service.dart';
import 'package:musicplayer/app/shared/widgets/app_bar/app_bar_controller.dart';
import 'package:musicplayer/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/app/app_widget.dart';
import 'package:musicplayer/app/modules/home/home_module.dart';

import 'modules/details_album/details_album_module.dart';
import 'modules/reproduction/reproduction_module.dart';
import 'shared/services/audio_service_interface.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ButtonPlayerController()),
        Bind((i) => WavesController()),
        Bind((i) => CardAlbunsController()),
        Bind<IAudioService>((i) => AudioService(i.get())),
        Bind((i) => AppBarController()),
        Bind((i) => AppController()),
        Bind((i) => FlutterAudioQuery()),
        Bind((i) => AudioStore(i.get())),
        Bind((i) => AudioPlayer(playerId: 'Identity')),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/detailsAlbum', module: DetailsAlbumModule()),
        Router('/reproduction', module: ReproductionModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
