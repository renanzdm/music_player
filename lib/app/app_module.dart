import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:musicplayer/app/app_controller.dart';
import 'package:musicplayer/app/shared/widgets/button_player/button_player_controller.dart';
import 'package:musicplayer/app/modules/details/details_module.dart';
import 'package:musicplayer/app/modules/reproduction/reproduction_module.dart';
import 'package:musicplayer/app/shared/widgets/bottom_app_bar/bottom_app_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:musicplayer/app/app_widget.dart';
import 'package:musicplayer/app/modules/home/home_module.dart';
import 'package:musicplayer/app/shared/widgets/app_bar/app_bar_controller.dart';
import 'package:musicplayer/app/shared/widgets/card_types/card_types_controller.dart';
import 'package:musicplayer/app/shared/widgets/playlist/playlist_controller.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController(i.get<AudioPlayer>())),
        Bind((i) => ButtonPlayerController()),
        Bind((i) => BottomAppBarController()),
        Bind((i) => PlaylistController()),
        Bind((i) => CardTypesController()),
        Bind((i) => AppBarController()),
        Bind((i) => FlutterAudioQuery()),
        Bind((i) => AudioPlayer(playerId: 'My_player')),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/details', module: DetailsModule()),
        Router('/reproduction', module: ReproductionModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
